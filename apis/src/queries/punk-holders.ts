import { db } from '@duneanalytics/sim-idx';
import { sql } from 'drizzle-orm';
import type { Context } from 'hono';

export interface PunkHolderData {
  date: string;
  address: string;
  balance: number;
}

export async function getPunkHolders(c: Context): Promise<PunkHolderData[]> {
  try {
    // Use Sim IDX's db.client(c) pattern with raw SQL
    const result = await db.client(c).execute(sql`
      WITH dates AS (
        SELECT GENERATE_SERIES(
          '2017-06-21'::date, 
          CURRENT_DATE, 
          '1 day'::interval
        )::date AS date
      ),
      
      -- Get all unique addresses from transfers and claims
      all_addresses AS (
        SELECT DISTINCT to_address AS address FROM punk_transfer
        WHERE block_timestamp > EXTRACT(EPOCH FROM '2017-06-21'::timestamp)
        UNION
        SELECT DISTINCT from_address AS address FROM punk_transfer 
        WHERE block_timestamp > EXTRACT(EPOCH FROM '2017-06-21'::timestamp)
        AND from_address != '\\x0000000000000000000000000000000000000000'
        UNION
        SELECT DISTINCT to_address AS address FROM punk_claimed
        WHERE block_timestamp > EXTRACT(EPOCH FROM '2017-06-21'::timestamp)
      ),
      
      -- Create reference table with all date/address combinations
      reference_table AS (
        SELECT d.date, a.address 
        FROM dates d
        CROSS JOIN all_addresses a
      ),
      
      -- Count claimed punks per address per day
      claimed_punks AS (
        SELECT 
          to_address,
          DATE(TO_TIMESTAMP(block_timestamp)) AS date,
          COUNT(*) AS claimed_count
        FROM punk_claimed
        WHERE block_timestamp > EXTRACT(EPOCH FROM '2017-06-21'::timestamp)
        GROUP BY to_address, DATE(TO_TIMESTAMP(block_timestamp))
      ),
      
      -- Count received punks per address per day (including claims)
      received_punks AS (
        SELECT 
          to_address,
          DATE(TO_TIMESTAMP(block_timestamp)) AS date,
          COUNT(*) AS received_count
        FROM punk_transfer
        WHERE block_timestamp > EXTRACT(EPOCH FROM '2017-06-21'::timestamp)
        GROUP BY to_address, DATE(TO_TIMESTAMP(block_timestamp))
        
        UNION ALL
        
        SELECT 
          to_address,
          date,
          claimed_count AS received_count
        FROM claimed_punks
      ),
      
      -- Count sent punks per address per day
      sent_punks AS (
        SELECT 
          from_address,
          DATE(TO_TIMESTAMP(block_timestamp)) AS date,
          COUNT(*) AS sent_count
        FROM punk_transfer
        WHERE block_timestamp > EXTRACT(EPOCH FROM '2017-06-21'::timestamp)
        AND from_address != '\\x0000000000000000000000000000000000000000'
        GROUP BY from_address, DATE(TO_TIMESTAMP(block_timestamp))
      ),
      
      -- Combine all data
      daily_movements AS (
        SELECT 
          r.date,
          r.address,
          COALESCE(rec.received_count, 0) AS received_count,
          COALESCE(sent.sent_count, 0) AS sent_count
        FROM reference_table r
        LEFT JOIN received_punks rec ON r.date = rec.date AND LOWER(r.address) = LOWER(rec.to_address)
        LEFT JOIN sent_punks sent ON r.date = sent.date AND LOWER(r.address) = LOWER(sent.from_address)
      ),
      
      -- Calculate running balances
      running_balances AS (
        SELECT 
          date,
          address,
          received_count,
          sent_count,
          SUM(received_count) OVER (PARTITION BY address ORDER BY date) AS running_received,
          SUM(sent_count) OVER (PARTITION BY address ORDER BY date) AS running_sent
        FROM daily_movements
      ),
      
      -- Calculate final balances
      final_balances AS (
        SELECT 
          date,
          address,
          (running_received - running_sent) AS balance
        FROM running_balances
      )
      
      SELECT 
        date::text,
        address,
        balance
      FROM final_balances
      WHERE balance > 0
      ORDER BY date DESC, balance DESC
    `);
    
    return result.rows as unknown as PunkHolderData[];
  } catch (error) {
    console.error('Error executing punk holders query:', error);
    throw error;
  }
}
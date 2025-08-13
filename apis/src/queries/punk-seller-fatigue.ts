import { db } from '@duneanalytics/sim-idx';
import { sql } from 'drizzle-orm';
import type { Context } from 'hono';

export interface PunkSellerFatigueData {
  block_timestamp: number;
  transaction_hash: string;
  eth_price: number;
  punk_id: number;
  buyer: string;
  seller: string;
  type: string;
}

export async function getPunkSellerFatigue(c: Context): Promise<PunkSellerFatigueData[]> {
  try {
    // Convert the date "2021-04-05" to timestamp for filtering
    const filterTimestamp = Math.floor(new Date('2021-04-05').getTime() / 1000);
    
    // Use Sim IDX's db.client(c) pattern with raw SQL
    const result = await db.client(c).execute(sql`
      WITH sales AS (
        SELECT  
          block_timestamp, 
          txn_hash::text as transaction_hash, 
          CAST(value AS NUMERIC) / POWER(10, 18) as eth_price, 
          punk_index as punk_id, 
          to_address as buyer, 
          from_address as seller,
          'sale' as type
        FROM punk_bought 
        WHERE block_timestamp > ${filterTimestamp}
          AND to_address != '\\x0000000000000000000000000000000000000000'
      ), 
      
      offers AS (
        SELECT  
          block_timestamp, 
          txn_hash::text as transaction_hash, 
          CAST(value AS NUMERIC) / POWER(10, 18) as eth_price, 
          punk_index as punk_id, 
          '0x' as buyer, 
          from_address as seller, 
          'offer' as type
        FROM punk_bought 
        WHERE block_timestamp > ${filterTimestamp}
          AND to_address = '\\x0000000000000000000000000000000000000000'
      ), 
      
      final AS (
        SELECT * 
        FROM sales 
        UNION ALL 
        SELECT * 
        FROM offers
      )
      
      SELECT *
      FROM final
      ORDER BY punk_id, block_timestamp DESC
    `);
    
    return result.rows as unknown as PunkSellerFatigueData[];
  } catch (error) {
    console.error('Error executing punk seller fatigue query:', error);
    throw error;
  }
}
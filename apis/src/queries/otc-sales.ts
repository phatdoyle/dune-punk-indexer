import { db } from '@duneanalytics/sim-idx';
import { sql } from 'drizzle-orm';
import type { Context } from 'hono';

export interface OTCSaleData {
  block_timestamp: number;
  transaction_hash: string;
  block_number: number;
  punk_index: number;
  value: string;
  from_address: string;
  to_address: string;
  value_eth: number;
}

export async function getOTCSales(
  c: Context, 
  startDate?: string, 
  endDate?: string
): Promise<OTCSaleData[]> {
  try {
    // Default to last 30 days if no dates provided
    const defaultEndDate = new Date();
    const defaultStartDate = new Date();
    defaultStartDate.setDate(defaultStartDate.getDate() - 30);
    
    const start = startDate || defaultStartDate.toISOString().split('T')[0];
    const end = endDate || defaultEndDate.toISOString().split('T')[0];
    
    // Convert dates to timestamps for comparison
    const startTimestamp = Math.floor(new Date(start).getTime() / 1000);
    const endTimestamp = Math.floor(new Date(end + 'T23:59:59Z').getTime() / 1000);
    
    // Use Sim IDX's db.client(c) pattern with raw SQL
    const result = await db.client(c).execute(sql`
      SELECT 
        block_timestamp,
        txn_hash,
        block_number,
        punk_index,
        value,
        from_address,
        to_address,
        value::numeric / POWER(10, 18) AS value_eth
      FROM punk_bought 
      WHERE to_address != '\\x0000000000000000000000000000000000000000'
        AND block_timestamp >= ${startTimestamp}
        AND block_timestamp <= ${endTimestamp}
      ORDER BY block_timestamp DESC
    `);
    
    return result.rows as unknown as OTCSaleData[];
  } catch (error) {
    console.error('Error executing OTC sales query:', error);
    throw error;
  }
}
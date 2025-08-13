import { db } from '@duneanalytics/sim-idx';
import { sql } from 'drizzle-orm';
import type { Context } from 'hono';

export interface FirstPurchaseData {
  buyer: string;
  block_timestamp: number;
  eth_price: number;
  punk_id: number;
  first_purchase: number;
  slots: string | null;
  url: string;
}

export async function getFirstPurchases(c: Context): Promise<FirstPurchaseData[]> {
  try {
    
    // Use Sim IDX's db.client(c) pattern with raw SQL
    const result = await db.client(c).execute(sql`
      WITH all_buys AS (
        SELECT 
          block_timestamp,
          txn_hash as transaction_hash, 
          CAST(value AS NUMERIC) / POWER(10, 18) as eth_price, 
          punk_index as punk_id, 
          to_address as buyer,
          from_address as seller
        FROM punk_bought 
        WHERE to_address != '\\x0000000000000000000000000000000000000000'
      ), 
      
      first_purchase AS (
        SELECT 
          buyer,
          block_timestamp, 
          eth_price,
          punk_id,
          ROW_NUMBER() OVER (PARTITION BY buyer ORDER BY block_timestamp ASC) as first_purchase
        FROM all_buys
      )
      
      SELECT 
        a.buyer,
        a.block_timestamp,
        a.eth_price,
        a.punk_id,
        a.first_purchase,
        NULL::text as slots,
        CONCAT('larvalabs.com/cryptopunks/details/', a.punk_id) as url
      FROM first_purchase a
      WHERE a.first_purchase = 1 
        AND a.buyer != '\\x0000000000000000000000000000000000000000'
      ORDER BY a.block_timestamp DESC
    `);
    
    return result.rows as unknown as FirstPurchaseData[];
  } catch (error) {
    console.error('Error executing first purchase query:', error);
    throw error;
  }
}
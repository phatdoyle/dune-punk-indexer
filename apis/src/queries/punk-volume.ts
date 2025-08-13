import { db } from '@duneanalytics/sim-idx';
import { sql } from 'drizzle-orm';
import type { Context } from 'hono';

export interface PunkVolumeData {
  period: string;
  total_sales: number;
  total_volume_eth: number;
  avg_price_eth: number;
  min_price_eth: number;
  max_price_eth: number;
  percentile_25_eth: number;
  percentile_50_eth: number;
  percentile_75_eth: number;
}

export async function getPunkVolume(c: Context, interval: string = 'DAY'): Promise<PunkVolumeData[]> {
  try {
    // Use Sim IDX's db.client(c) pattern with raw SQL
    const result = await db.client(c).execute(sql`
      SELECT 
        date_trunc(${interval}, to_timestamp(block_timestamp)) AS period,
        COUNT(*) AS total_sales,
        SUM(value) / POWER(10, 18) AS total_volume_eth,
        AVG(value) / POWER(10, 18) AS avg_price_eth,
        MIN(CASE WHEN value > 0 THEN value END) / POWER(10, 18) AS min_price_eth,
        MAX(value) / POWER(10, 18) AS max_price_eth,
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY value) / POWER(10, 18) AS percentile_25_eth,
        PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY value) / POWER(10, 18) AS percentile_50_eth,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY value) / POWER(10, 18) AS percentile_75_eth
      FROM punk_bought
      WHERE value > 0
      GROUP BY period
      ORDER BY period DESC
    `);
    
    return result.rows as unknown as PunkVolumeData[];
  } catch (error) {
    console.error('Error executing punk volume query:', error);
    throw error;
  }
} 
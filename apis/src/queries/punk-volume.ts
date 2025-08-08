import { db } from '@duneanalytics/sim-idx';
import { sql } from 'drizzle-orm';
import type { Context } from 'hono';

export interface PunkVolumeData {
  period: string;
  total_txns: number;
  total_volume_eth: number;
}

export async function getPunkVolume(c: Context, interval: string = 'DAY'): Promise<PunkVolumeData[]> {
  try {
    // Use Sim IDX's db.client(c) pattern with raw SQL
    const result = await db.client(c).execute(sql`
      SELECT 
        date_trunc(${interval}, to_timestamp(block_timestamp)) AS period,
        COUNT(*) AS total_txns,
        SUM(value) / POWER(10, 18) AS total_volume_eth
      FROM "will-late-cK6wtMS1FB".punk_bought
      GROUP BY period
      ORDER BY period DESC
    `);
    
    return result.rows as unknown as PunkVolumeData[];
  } catch (error) {
    console.error('Error executing punk volume query:', error);
    throw error;
  }
} 
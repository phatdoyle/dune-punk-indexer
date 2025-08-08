import { eq } from "drizzle-orm";
import { types, db, App, middlewares } from "@duneanalytics/sim-idx"; // Import schema to ensure it's registered
import { getPunkVolume, PunkVolumeData } from "./queries/punk-volume";



const app = App.create();
app.use("*", middlewares.authentication);

app.get("/punk-volume", async (c) => {
  try {
    // Get interval parameter from query string, default to 'DAY'
    const interval = c.req.query('interval') || 'DAY';
    
    // Validate interval parameter
    const validIntervals = ['HOUR', 'DAY', 'WEEK', 'MONTH'];
    if (!validIntervals.includes(interval.toUpperCase())) {
      return Response.json({ 
        error: `Invalid interval. Must be one of: ${validIntervals.join(', ')}` 
      }, { status: 400 });
    }
    
    const volumeData = await getPunkVolume(c, interval.toUpperCase());
    
    return Response.json({
      interval: interval.toUpperCase(),
      data: volumeData,
      total_records: volumeData.length
    });
  } catch (e) {
    console.error("Punk volume query failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
  }
});

app.get("/*", async (c) => {
  try {
    
    return Response.json({
      result: "hello world",
    });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
  }
});

export default app;


import { eq } from "drizzle-orm";
import { types, db, App, middlewares } from "@duneanalytics/sim-idx"; // Import schema to ensure it's registered
import { getPunkVolume, PunkVolumeData } from "./queries/punk-volume";
import { getPunkHolders, PunkHolderData } from "./queries/punk-holders";
import { getOTCSales, OTCSaleData } from "./queries/otc-sales";
import { getFirstPurchases, FirstPurchaseData } from "./queries/first-purchase";
import { getPunkSellerFatigue, PunkSellerFatigueData } from "./queries/punk-seller-fatigue";



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

app.get("/punk-holders", async (c) => {
  try {
    const holderData = await getPunkHolders(c);
    
    return Response.json({
      data: holderData,
      total_records: holderData.length,
      description: "Punk holders with positive balances ordered by date (most recent first) and balance (highest first)"
    });
  } catch (e) {
    console.error("Punk holders query failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
  }
});

app.get("/otc-sales", async (c) => {
  try {
    // Get date parameters from query string
    const startDate = c.req.query('start_date');
    const endDate = c.req.query('end_date');
    
    // Validate date format if provided
    if (startDate && isNaN(Date.parse(startDate))) {
      return Response.json({ 
        error: "Invalid start_date format. Use YYYY-MM-DD format." 
      }, { status: 400 });
    }
    
    if (endDate && isNaN(Date.parse(endDate))) {
      return Response.json({ 
        error: "Invalid end_date format. Use YYYY-MM-DD format." 
      }, { status: 400 });
    }
    
    // Validate date range
    if (startDate && endDate && new Date(startDate) > new Date(endDate)) {
      return Response.json({ 
        error: "start_date cannot be after end_date." 
      }, { status: 400 });
    }
    
    const otcSalesData = await getOTCSales(c, startDate, endDate);
    
    // Calculate date range for response
    const defaultEndDate = new Date();
    const defaultStartDate = new Date();
    defaultStartDate.setDate(defaultStartDate.getDate() - 30);
    
    const actualStartDate = startDate || defaultStartDate.toISOString().split('T')[0];
    const actualEndDate = endDate || defaultEndDate.toISOString().split('T')[0];
    
    return Response.json({
      date_range: {
        start_date: actualStartDate,
        end_date: actualEndDate
      },
      data: otcSalesData,
      total_records: otcSalesData.length,
      description: "OTC sales (excluding zero address transfers) ordered by timestamp (most recent first)"
    });
  } catch (e) {
    console.error("OTC sales query failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
  }
});

app.get("/first-purchase", async (c) => {
  try {
    const firstPurchaseData = await getFirstPurchases(c);
    
    return Response.json({
      data: firstPurchaseData,
      total_records: firstPurchaseData.length,
      description: "First-time CryptoPunk buyers ordered by timestamp (most recent first)"
    });
  } catch (e) {
    console.error("First purchase query failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
  }
});

app.get("/punk-seller-fatigue", async (c) => {
  try {
    const sellerFatigueData = await getPunkSellerFatigue(c);
    
    return Response.json({
      data: sellerFatigueData,
      total_records: sellerFatigueData.length,
      description: "Punk seller fatigue analysis: sales and offers since April 5, 2021, ordered by punk ID and timestamp (most recent first)"
    });
  } catch (e) {
    console.error("Punk seller fatigue query failed:", e);
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


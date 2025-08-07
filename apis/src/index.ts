import { eq } from "drizzle-orm";
import { types, db, App, middlewares } from "@duneanalytics/sim-idx"; // Import schema to ensure it's registered



const app = App.create();
app.use("*", middlewares.authentication);

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


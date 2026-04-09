import app from "./app";
import { logger } from "./lib/logger";
import { runSeed } from "./seed";

const port = Number(process.env["PORT"] ?? 3000);

app.listen(port, (err) => {
  if (err) {
    logger.error({ err }, "Error listening on port");
    process.exit(1);
  }

  logger.info({ port }, "Server listening");

  if (process.env.DATABASE_URL) {
    runSeed()
      .then(() => {
        logger.info("Database seed complete");
      })
      .catch((err) => {
        logger.error({ err }, "Database seed failed — server still running");
      });
  } else {
    logger.warn("DATABASE_URL not set — skipping seed");
  }
});

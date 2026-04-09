ALTER TABLE "courses" ADD COLUMN IF NOT EXISTS "badge" text DEFAULT '';
--> statement-breakpoint
ALTER TABLE "courses" ADD COLUMN IF NOT EXISTS "stats" jsonb;
--> statement-breakpoint
ALTER TABLE "courses" ADD COLUMN IF NOT EXISTS "topics" jsonb;
--> statement-breakpoint
ALTER TABLE "courses" ADD COLUMN IF NOT EXISTS "for_whom" jsonb;

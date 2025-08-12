CREATE TABLE "attendees" (
	"id" serial PRIMARY KEY NOT NULL,
	"first_name" text,
	"last_name" text,
	"phone_number" text,
	"email_address" text,
	"unit_id" serial NOT NULL,
	CONSTRAINT "attendees_email_address_unique" UNIQUE("email_address")
);
--> statement-breakpoint
CREATE TABLE "eventType" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE "events" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"type" serial NOT NULL,
	"allowed_places" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE "unitType" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE "units" (
	"id" serial PRIMARY KEY NOT NULL,
	"type" serial NOT NULL,
	"location" text,
	"unit_number" integer
);
--> statement-breakpoint
CREATE TABLE "users" (
	"id" serial PRIMARY KEY NOT NULL,
	"email_address" text NOT NULL,
	"password" text NOT NULL,
	"is_admin" boolean,
	CONSTRAINT "users_email_address_unique" UNIQUE("email_address")
);
--> statement-breakpoint
ALTER TABLE "attendees" ADD CONSTRAINT "attendees_unit_id_units_id_fk" FOREIGN KEY ("unit_id") REFERENCES "public"."units"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "events" ADD CONSTRAINT "events_type_eventType_id_fk" FOREIGN KEY ("type") REFERENCES "public"."eventType"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "units" ADD CONSTRAINT "units_type_unitType_id_fk" FOREIGN KEY ("type") REFERENCES "public"."unitType"("id") ON DELETE no action ON UPDATE no action;
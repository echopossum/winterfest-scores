import { pgTable, serial, integer, text, boolean } from 'drizzle-orm/pg-core';

export const users = pgTable('users', {
	id: serial('id').primaryKey(),
	email_address: text('email_address').notNull().unique(),
	password: text('password').notNull(),
	isAdmin: boolean('is_admin')
});

export const eventType = pgTable('eventType', {
	id: serial('id').primaryKey(),
	name: text('name').notNull()
});

export const events = pgTable('events', {
	id: serial('id').primaryKey(),
	name: text('name').notNull(),
	eventType: serial('type')
		.notNull()
		.references(() => eventType.id),
	allowedPlaces: integer('allowed_places').notNull()
});

export const unitType = pgTable('unitType', {
	id: serial('id').primaryKey(),
	name: text('name').notNull()
});

export const units = pgTable('units', {
	id: serial('id').primaryKey(),
	unitType: serial('type')
		.notNull()
		.references(() => unitType.id),
	location: text('location'),
	unitNumber: integer('unit_number')
});

export const attendees = pgTable('attendees', {
	id: serial('id').primaryKey(),
	firstName: text('first_name'),
	lastName: text('last_name'),
	phoneNumber: text('phone_number'),
	email_address: text('email_address').unique(),
	unit: serial('unit_id').references(() => units.id)
});

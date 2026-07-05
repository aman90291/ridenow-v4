import { pgTable, uuid, text, timestamp } from 'drizzle-orm/pg-core';

// Minimal founding schema — later stories extend this (fares, payments, GPS…).
export const rides = pgTable('rides', {
  id: uuid('id').primaryKey().defaultRandom(),
  riderPhone: text('rider_phone').notNull(),
  status: text('status').notNull().default('requested'),
  createdAt: timestamp('created_at', { withTimezone: true }).notNull().defaultNow(),
});

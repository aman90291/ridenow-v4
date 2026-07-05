#!/usr/bin/env bash
# Reset + seed the RideNow database running under docker-compose.
set -euo pipefail

echo "→ Resetting schema and seeding demo data…"
docker compose exec -T db psql -U ridenow -d ridenow <<'SQL'
CREATE EXTENSION IF NOT EXISTS postgis;
DROP TABLE IF EXISTS rides;
CREATE TABLE rides (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  rider_phone text NOT NULL,
  status text NOT NULL DEFAULT 'requested',
  created_at timestamptz NOT NULL DEFAULT now()
);
INSERT INTO rides (rider_phone, status) VALUES ('+15555550123', 'requested');
SQL
echo "✓ Seed complete."

# RideNow v4

Ride-hailing platform (rider + driver) that runs end-to-end on localhost.

## Stack

- **Backend:** TypeScript · NestJS · Drizzle ORM · PostgreSQL 16 + PostGIS
- **Web:** Next.js / React — two apps: `rider-web`, `driver-web`
- **Geo:** OpenStreetMap — Nominatim (geocoding) + OSRM (routing), keyless
- **OTP:** Twilio (logged to console in dev)
- **Payments:** Stripe (test mode)
- **Infra:** docker-compose on localhost

This repository is the **founding scaffold**: a runnable skeleton with a health
endpoint, CI (lint · typecheck · test), and the manifests every later feature
story builds on.

## Layout

```
.
├── apps
│   ├── api          # NestJS backend (health endpoint, Drizzle schema)
│   ├── rider-web    # Next.js rider app  (:3001)
│   └── driver-web   # Next.js driver app (:3002)
├── db/init          # Postgres init SQL (enables PostGIS)
├── scripts          # smoke + seed/reset helpers
├── docker-compose.yml
└── .github/workflows/ci.yml
```

## Prerequisites

- Node.js >= 20
- Docker + Docker Compose (for the full local stack)

## Quickstart (backend + tooling)

```bash
npm install          # installs every workspace
npm run typecheck
npm run lint
npm run test
npm run dev:api      # NestJS API on http://localhost:3000
curl -s localhost:3000/health
```

## Full stack (docker-compose)

```bash
cp .env.example .env
docker compose up --build
```

| Service    | URL                    |
|------------|------------------------|
| api        | http://localhost:3000  |
| rider-web  | http://localhost:3001  |
| driver-web | http://localhost:3002  |
| db         | postgres://…:5432      |

## Watch the core loop (one-liner)

```bash
npm run smoke        # or: API_URL=http://localhost:3000 bash scripts/smoke.sh
```

## Seed / reset the database

```bash
npm run seed         # resets schema + inserts demo data into the compose db
```

## CI

`.github/workflows/ci.yml` runs three jobs on every PR — **lint**, **typecheck**,
**test** — each on a fresh clone via `npm install`. It deliberately avoids
`npm ci` and `cache: npm` so the build is green whether or not a lockfile is
present yet.

## Lockfile

Run `npm install` once locally and commit the generated `package-lock.json`.
CI uses `npm install` (not `npm ci`) so a fresh clone stays green in either case;
committing the lockfile pins exact versions for reproducible installs.

## Health check

`GET /health` → `{ "status": "ok", "service": "ridenow-api", "timestamp": "…" }`

Covered by `apps/api/src/health/health.controller.spec.ts`.

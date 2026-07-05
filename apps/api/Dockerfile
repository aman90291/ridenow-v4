# Build context is the repo root (see docker-compose.yml).
# ---- Build stage: full toolchain to compile TypeScript ----
FROM node:20-alpine AS build
WORKDIR /app
COPY . .
# Scoped install: only @ridenow/api (+ workspace root) deps get installed,
# so rider-web/driver-web's Next.js/React never enter this image. The api's
# own devDependencies (nest-cli, etc.) are included for the build below and
# stripped afterward by `npm prune --omit=dev`.
RUN npm install --workspace @ridenow/api --include-workspace-root
RUN npm run build --workspace @ridenow/api
# Strip devDependencies (nest-cli, jest, ts-jest, drizzle-kit) from the installed tree.
RUN npm prune --omit=dev

# ---- Runtime stage: production deps + built output only, non-root ----
FROM node:20-alpine AS runtime
WORKDIR /app
ENV NODE_ENV=production
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/apps/api/dist ./apps/api/dist
COPY --from=build /app/apps/api/package.json ./apps/api/package.json
USER node
EXPOSE 3000
CMD ["node", "apps/api/dist/main.js"]

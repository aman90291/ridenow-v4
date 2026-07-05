# Build context is the repo root (see docker-compose.yml).
FROM node:20-alpine
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --workspace @ridenow/api
EXPOSE 3000
CMD ["node", "apps/api/dist/main.js"]

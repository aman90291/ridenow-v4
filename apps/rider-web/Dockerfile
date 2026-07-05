# Build context is the repo root (see docker-compose.yml).
FROM node:20-alpine
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --workspace @ridenow/rider-web
EXPOSE 3001
CMD ["npm", "run", "start", "--workspace", "@ridenow/rider-web"]

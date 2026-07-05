# Build context is the repo root (see docker-compose.yml).
FROM node:20-alpine
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --workspace @ridenow/driver-web
EXPOSE 3002
CMD ["npm", "run", "start", "--workspace", "@ridenow/driver-web"]

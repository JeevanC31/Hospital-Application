# Stage 1: Build dependencies
FROM node:20-alpine AS builder
WORKDIR /app
COPY backend/package*.json ./
RUN npm install
COPY backend/ ./

# Stage 2: Final runtime image
FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app /app
COPY public/ /public/
EXPOSE 5000
CMD ["node", "app.js"]

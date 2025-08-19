# Multi-stage Dockerfile - build with Node on Alpine, produce a minimal runtime image

# Build stage
FROM node:18-alpine AS build
WORKDIR /app

# Install dependencies for build
COPY package.json package-lock.json* ./
RUN npm ci --silent

# Copy sources and build
COPY tsconfig.json ./
COPY src ./src
RUN npm run build --silent

# Runtime stage (small Alpine with Node)
FROM node:18-alpine AS runtime
WORKDIR /app
ENV NODE_ENV=production

# Only install production dependencies
COPY package.json package-lock.json* ./
RUN npm ci --production --silent

# Copy built files from build stage
COPY --from=build /app/dist ./dist

EXPOSE 3000
CMD ["node", "dist/server.js"]

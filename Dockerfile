# Production Dockerfile for Cloud Run
FROM node:22-alpine

# Set working directory
WORKDIR /usr/src/app

# Install dependencies using lockfile
COPY package*.json ./
RUN npm ci --omit=dev

# Copy application source (only what's needed for the backend)
COPY server.js ./

# Environment
ENV NODE_ENV=production

# Cloud Run listens on $PORT; our app already uses process.env.PORT with default 3000
EXPOSE 3000

# Start the server
CMD ["npm", "start"]



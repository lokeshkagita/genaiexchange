# Production Dockerfile for Cloud Run
FROM node:22-alpine

# Set working directory
WORKDIR /usr/src/app

# Install dependencies using lockfile
COPY package*.json ./
RUN npm ci --omit=dev

# Copy all application files
COPY . .

# Environment
ENV NODE_ENV=production

# Cloud Run listens on $PORT (default 8080)
EXPOSE 8080

# Start the server
CMD ["npm", "start"]

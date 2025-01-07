# Use the official Node.js 18 image
FROM node:18-slim

# Create app directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy source code
COPY . .

# Build TypeScript
RUN npm run build

# Expose port
EXPOSE 8080

# Start the server
CMD [ "node", "dist/index.js" ]

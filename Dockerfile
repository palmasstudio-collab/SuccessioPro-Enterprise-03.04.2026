# Use Node.js 22 as the base image
FROM node:22-slim

# Set the working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Set environment to production
ENV NODE_ENV=production
ENV PORT=8080

# Copy the rest of the application code
COPY . .

# Build the frontend
RUN npm run build

# Expose the port (Cloud Run uses 8080 by default)
EXPOSE 8080

# Start the application using the production script defined in package.json
CMD ["npm", "start"]

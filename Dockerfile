# Use the official Node.js 16 image as the base image
FROM node:16

# Set environment variables
ENV NODE_ENV=production

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install project dependencies
RUN npm install --production

# Copy the rest of the application code to the container
COPY . .

# Build the React app
RUN npm run build

# Serve the build using a simple HTTP server (if it's a React app intended for deployment)
# Optional: Install 'serve' or any other static file server
RUN npm install -g serve

# Expose the port that the app will run on (usually 3000 by default)
EXPOSE 3000

# Start the React app when the container starts
CMD ["serve", "-s", "build"]

# Alternatively, if using npm start (typically for development):
# CMD [ "npm", "start" ]

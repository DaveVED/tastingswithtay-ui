# Use an official Node.js runtime as a parent image
FROM --platform=linux/amd64 node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the app's dependencies
RUN npm install

# Copy the rest of the app's code to the container
COPY . .

# Build the app
RUN npm run build

# Set the environment variable for the port the app will listen on
ENV PORT=3000

# Expose the port the app will listen on
EXPOSE 3000

# Run the app
CMD [ "npm", "start" ]

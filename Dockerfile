
FROM node:14-alpine
# Set the working directory to /app
WORKDIR /app
# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./
# Install dependencies
RUN npm install
# Copy the rest of the application code to the working directory
COPY . .
# Build the production version of the application
RUN npm run build
# Expose port 3000 to the outside world
EXPOSE 3000
# Start the application
CMD [ "npm", "start" ]

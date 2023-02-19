FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the dependencies inside the container
RUN npm install

# Copy the rest of the application files to the container
COPY . .

# Build the application inside the container
RUN npm run build

# Set the command to run when the container starts
CMD ["npm", "start"]

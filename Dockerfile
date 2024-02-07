# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Set the environment variable for the app
ENV NODE_ENV=prod \
    CLIENT_ID=STG-201806885D-PPICTECH-COURSEREGN \
    CALLBACK_URL=https://bexo.besorchestrator.app/mistg/callback \
    CREATE_TRAINEE_URL=https://bexo.besorchestrator.app/mistg/createTrainee \
    PURPOSE_ID=32db3fba \
    AUTHORIZE_URL=https://api.myinfo.gov.sg/com/v4/authorize

# Expose the port that the app will listen on
EXPOSE 3001

# Start the app
CMD ["npm", "start"]

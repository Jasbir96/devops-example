# base image
FROM node:20-alpine AS builder

# metadata to explain the version description and maintainer
LABEL maintainer="Jasbir Singh"
LABEL version="1.0"
LABEL description="Docker image for the React.js app"


# set the working directory
WORKDIR /app

# copy the package.json file to the working directory
COPY package*.json ./

# clean install dependencies 
RUN npm ci

# copy the rest of the application code to the working directory
COPY . .

# build the application
RUN npm run build

# runtime stage
FROM node:20-alpine

# install serve to serve the built application
RUN npm install -g serve

# set the working directory
WORKDIR /app

# copy the built application from the builder stage
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./

# set the environment variables
ENV NODE_ENV=production
ENV PORT=3000

# expose the port that the application listens on
EXPOSE 3000

# command to run the application
CMD ["serve", "-s", "dist", "-l", "3000"]

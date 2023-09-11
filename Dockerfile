# Start from the official Swift Docker image
FROM ghcr.io/swiftwasm/carton:latest

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . .

# Build the app
# RUN carton dev
EXPOSE 8080

# Start the app
CMD ["carton", "dev"]

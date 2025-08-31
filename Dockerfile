# Use a base image with Flutter and the necessary dependencies
FROM ghcr.io/cirruslabs/flutter:3.32.4 AS build


# Create a non-root user
#RUN adduser -D flutteruser
#USER flutteruser

# Set the working directory in the container
WORKDIR /app

# Copy the project files into the container
COPY . .

# Get Flutter dependencies
RUN flutter pub get

# Build the Flutter web app
RUN flutter build web

# Use a lightweight web server to serve the built app
FROM nginx:alpine

# Copy the built web app from the previous stage into the Nginx serving directory
COPY --from=0 /app/build/web /usr/share/nginx/html

# Expose port 80 for the web server
EXPOSE 80

# Command to run Nginx
CMD ["nginx", "-g", "daemon off;"]

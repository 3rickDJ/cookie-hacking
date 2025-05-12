# Use a lightweight Ruby image
FROM ruby:3.4.3-alpine3.21

# Install build dependencies
RUN apk add --no-cache build-base libffi-dev

# Set the working directory
WORKDIR /app

# Install dependencies
RUN gem install rackup puma sinatra

# Copy the rest of the application code
COPY . .

# Expose the Sinatra default port
EXPOSE 4567

# Command to run the Sinatra server
CMD ["ruby", "server.rb", "-o", "0.0.0.0"]

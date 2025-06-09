# Use Kali Linux as the base image
FROM kalilinux/kali-rolling

# Set working directory
WORKDIR /app

# Update and install required dependencies (add any additional packages you may need)
RUN apt update && apt upgrade -y \
    && apt install -y \
    openssh-client \
    curl \
    git \
    nodejs \
    npm \
    && apt clean

# Copy the application code into the container
COPY . .

# Install Node.js dependencies (if using Node.js)
RUN npm install

# Copy the entrypoint script and tunnel script into the container
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY start-tunnel.sh /start-tunnel.sh

# Make sure the scripts are executable
RUN chmod +x /docker-entrypoint.sh /start-tunnel.sh

# Set the entrypoint for the Docker container
ENTRYPOINT ["/docker-entrypoint.sh"]

# Expose the port the app runs on
EXPOSE 3000

#!/bin/bash

# Start MySQL in the background
docker-entrypoint.sh mysqld &

# Wait for MySQL to be ready
until mysqladmin ping -h "127.0.0.1" --silent; do
  echo "Waiting for MySQL to start..."
  sleep 2
done

echo "MySQL is up."

# Launch a simple HTTP server on port 10000
# So Render sees an open port and marks the service as "live"
echo "Starting dummy HTTP server on port 10000..."
python3 -m http.server 10000
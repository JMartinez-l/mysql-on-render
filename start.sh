#!/bin/bash

# Wait until MySQL is accepting connections
until mysqladmin ping -h "localhost" --silent; do
  echo "Waiting for MySQL to start..."
  sleep 2
done

# Start MySQL server (if needed) or your app here
exec "$@"

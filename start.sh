#!/bin/bash

# Initialize MySQL data directory if empty
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MySQL database..."
    mysqld --initialize-insecure
fi

# Start MySQL in safe mode
mysqld_safe --datadir=/var/lib/mysql &

# Wait for MySQL to start
until mysqladmin ping -h "127.0.0.1" --silent; do
  echo "Waiting for MySQL to start..."
  sleep 2
done

echo "MySQL is up."

# Create root user and test DB if not already set
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS testdb;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'testpassword';
FLUSH PRIVILEGES;
EOF

# Dummy HTTP server to keep container alive
while true; do
  {
    echo -e "HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nOK"
  } | nc -l -p 10000
done

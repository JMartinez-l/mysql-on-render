#!/bin/bash

docker-entrypoint.sh mysqld &

while true; do echo -e "HTTP/1.1 200 OK\n\nMySQL is running" | nc -1k -p $PORT; done
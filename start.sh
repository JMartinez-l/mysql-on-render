FROM ubuntu:22.04

# Install MySQL and netcat
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server netcat && \
    apt-get clean

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose MySQL and fake HTTP server port
EXPOSE 3306 10000

CMD ["sh", "/start.sh"]

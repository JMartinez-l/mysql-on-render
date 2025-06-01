FROM ubuntu:22.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server netcat && \
    apt-get clean

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 3306 10000

CMD ["sh", "/start.sh"]

FROM mysql:8.0.33

RUN apk update && apk add netcat-openbsd

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]

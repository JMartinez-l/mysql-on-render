FROM mysql:8.0.33-debian

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]

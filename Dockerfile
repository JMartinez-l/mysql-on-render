FROM mysql:8.0.33-debian

# Copy and allow execution of the start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose MySQL and dummy HTTP port
EXPOSE 3306 10000

CMD ["/start.sh"
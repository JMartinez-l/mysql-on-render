FROM mysql:8.0.33-debian

# Add missing GPG key for MySQL repo
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B7B3B788A8D3785C

RUN apt-get update && apt-get install -y netcat

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]

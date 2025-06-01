FROM mysql:8.0.33-debian

# Install gnupg and dirmngr to manage keys and add MySQL repo key
RUN apt-get update && apt-get install -y gnupg dirmngr wget netcat \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B7B3B788A8D3785C \
  && apt-get update \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
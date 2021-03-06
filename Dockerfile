FROM ubuntu:focal
LABEL org.opencontainers.image.source="https://github.com/dviih/gotty" author="Dviih"

ADD ./gotty /gotty
ADD ./entrypoint.sh /entrypoint.sh

RUN \
  chmod +x /entrypoint.sh && \
  chmod +x /gotty

RUN adduser --disabled-password --home /home/container container
USER container
ENV  USER=container HOME=/home/container

CMD ["/bin/bash", "/entrypoint.sh"]
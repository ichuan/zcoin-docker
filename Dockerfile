FROM ubuntu:18.04
SHELL ["/bin/bash", "-c"]

RUN mkdir -p /opt/coin
WORKDIR /opt/coin

EXPOSE 8888

RUN apt-get update && apt-get install -y wget python
RUN wget https://github.com/firoorg/firo/releases/download/v0.14.1.2/firo-0.14.1.2-linux64.tar.gz -O - | tar --strip-components 1 -C /opt/coin -xzf -

# cleanup
RUN rm -rf /var/lib/apt/lists/* bin/{firo-qt,firo-tx,tor*}

ENTRYPOINT ["/opt/coin/bin/firod"]
CMD ["-conf=/opt/coin/coin.conf"]

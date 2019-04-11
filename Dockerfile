FROM ubuntu:18.04

RUN mkdir -p /opt/coin
WORKDIR /opt/coin

EXPOSE 8888

RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/zcoinofficial/zcoin/releases/download/v0.13.7.7/zcoin-0.13.7.7-linux64.tar.gz -O - | tar --strip-components 1 -C /opt/coin -xzf -

# cleanup
RUN rm -rf /var/lib/apt/lists/*

VOLUME ["/opt/coin/data", "/opt/coin/coin.conf"]

ENTRYPOINT ["/opt/coin/bin/zcoind"]
CMD ["-conf=/opt/coin/coin.conf"]

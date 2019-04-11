# zcoin-docker
Dockerfile for zcoin


# Building

```bash
docker build -t zcoin .
```

# Running

Customize config file `coin.conf` first.

```bash
# block dir
mkdir data
docker run --rm -itd --name ixzc -p 8888:8888 -v `pwd`/data:/opt/coin/data -v `pwd`/coin.conf:/opt/coin/coin.conf zcoin
```

# Using pre-built docker image

```bash
docker run --rm -itd --name ixzc -p 8888:8888 -v `pwd`/data:/opt/coin/data -v `pwd`/coin.conf:/opt/coin/coin.conf mixhq/zcoin:latest
```

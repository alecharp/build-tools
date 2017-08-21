FROM ubuntu:17.04
MAINTAINER Adrien Lecharpentier <me@alecharp.fr>

RUN groupadd -g 1000 build && \
  useradd -m -u 1000 -g 1000 build

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y \
    curl \
    git \
    gpg

ENV NODE_VERSION 8.4.0
RUN ARCH= && dpkgArch="$(dpkg --print-architecture)" \
  && case "${dpkgArch##*-}" in \
    amd64) ARCH='x64';; \
    ppc64el) ARCH='ppc64le';; \
    s390x) ARCH='s390x';; \
    arm64) ARCH='arm64';; \
    armhf) ARCH='armv7l';; \
    *) echo "unsupported architecture"; exit 1 ;; \
  esac \
  && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.gz" \
  && tar xf "node-v$NODE_VERSION-linux-$ARCH.tar.gz" -C /usr/local --strip-components=1 \
  && rm "node-v$NODE_VERSION-linux-$ARCH.tar.gz" \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  && chmod +x /usr/local/bin/node

USER build
WORKDIR /home/build

FROM alpine:3.6
MAINTAINER Adrien Lecharpentier <me@alecharp.fr>

RUN addgroup -g 1000 build && \
  adduser -D -u 1000 -G build build

RUN apk --update add \
  curl \
  openjdk8 \
  git

ENV MAVEN_VERSION 3.5.0
RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME /usr/share/maven

USER build
WORKDIR /home/build

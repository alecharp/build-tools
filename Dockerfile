FROM ubuntu:16.04
MAINTAINER Adrien Lecharpentier <me@alecharp.fr>

RUN apt-get update \
  && apt-get -y upgrade

RUN groupadd -g 1000 build && \
  useradd -u 1000 -g 1000 -m -s /bin/bash build

RUN apt-get install -y \
  curl \
  openjdk-8-jdk \
  git

ENV MAVEN_VERSION 3.5.0
RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME /usr/share/maven

USER build
WORKDIR /home/build

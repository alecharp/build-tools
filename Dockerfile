FROM ubuntu:16.04
MAINTAINER Adrien Lecharpentier <me@alecharp.fr>

RUN apt-get update \
  && apt-get -y upgrade

RUN apt-get install -y \
  curl \
  openjdk-8-jdk \
  git

ENV MAVEN_VERSION 3.3.9
RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME /usr/share/maven

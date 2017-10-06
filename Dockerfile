FROM docker:17.09
MAINTAINER Adrien Lecharpentier <adrien.lecharpentier@gmail.com>

ENV JRE_VERSION=8.131.11-r2
RUN apk --update --no-cache add \
  openjdk8-jre=$JRE_VERSION

# Install AWS cli
RUN apk --update --no-cache add \
  py2-pip
RUN pip install awscli --upgrade --user
ENV PATH $PATH:/root/.local/bin

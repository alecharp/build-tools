FROM docker:17.11
MAINTAINER Adrien Lecharpentier <adrien.lecharpentier@gmail.com>

# Prepare image to be used as Jenkins Agent
ENV JRE_VERSION=8.131.11-r2
RUN apk --update --no-cache add \
  openjdk8-jre=$JRE_VERSION \
  git

# Install AWS cli
RUN apk --update --no-cache add \
  py2-pip
RUN pip install awscli --upgrade --user
ENV PATH $PATH:/root/.local/bin

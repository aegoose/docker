# FROM ubuntu:14.04
FROM ubuntu:trusty

MAINTAINER aegoose "aegoose@126.com"

ADD sources.list /etc/apt/

RUN apt-get update

RUN apt-get install -y \
    build-essential \
    git \
    wget \
    curl \
    zsh \
    vim \
    tmux

# COPY ./docker-entrypoint.sh /
# ENTRYPOINT ["/docker-entrypoint.sh"]





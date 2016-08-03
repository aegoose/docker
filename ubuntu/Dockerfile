# FROM ubuntu:14.04
FROM ubuntu:trusty

MAINTAINER aegoose "aegoose@126.com"

# RUN echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null

ADD sources.list /etc/apt/

RUN apt-get clean && apt-get update -y

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get clean \
    && apt-get update -y \
    && apt-get install -y --force-yes \
        build-essential \
        git \
        wget \
        curl \
        zsh \
        vim \
        tmux \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# COPY ./docker-entrypoint.sh /
# ENTRYPOINT ["/docker-entrypoint.sh"]





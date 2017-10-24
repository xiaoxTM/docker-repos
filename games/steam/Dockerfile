FROM debian:latest
ENV DEBIAN_FRONTEND noninteractive
LABEL maintainer "Renwu Gao <gilyou.public@gmail.com>"

# NOTE:
#     debian docker with 'latest' tag
#     always points to 'stable' version
RUN echo 'deb http://httpredir.debian.org/debian/ stable main contrib non-free' >> /etc/apt/sources.list \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -yq steam \
    && rm -rf /var/lib/apt/lists/*

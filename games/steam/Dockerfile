FROM debian:latest
ENV DEBIAN_FRONTEND noninteractive
LABEL maintainer "Renwu Gao <gilyou.public@gmail.com>"

RUN deb http://httpredir.debian.org/debian/ jessie main contrib non-free \
    && dpkg --add-architecture i386

RUN apt-get update && apt-get install -y steam libgl1-nvidia-glx:i386 \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

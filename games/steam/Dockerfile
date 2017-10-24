FROM debian:latest
ENV DEBIAN_FRONTEND noninteractive
LABEL maintainer "Renwu Gao <gilyou.public@gmail.com>"

# add repository to debian
# note: this is version dependent
# this Dockerfile is for 'stretch'
# if you have different debian version
# change the following 'stretch' to 'your-version'
RUN echo 'deb http://deb.debian.org/debian/ stretch main contrib non-free' >> /etc/apt/sources.list \
    && echo 'deb-src http://deb.debian.org/debian/ stretch main contrib non-free' >> /etc/apt/sources.list \
    && echo 'deb http://deb.debian.org/debian/ stretch-updates main contrib non-free' >> /etc/apt/sources.list \
    && echo 'deb-src http://deb.debian.org/debian/ stretch-updates main contrib non-free' >> /etc/apt/sources.list \
    && echo 'deb http://security.debian.org/ stretch/updates main contrib non-free' >> /etc/apt/sources.list \
    && echo 'deb-src http://security.debian.org/ stretch/updates main contrib non-free' >> /etc/apt/sources.list \
    && dpkg --add-architecture i386

RUN apt-get update && apt-get install -y steam libgl1-nvidia-glx:i386 \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

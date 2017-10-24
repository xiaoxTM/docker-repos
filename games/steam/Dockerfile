FROM debian:latest
ENV DEBIAN_FRONTEND noninteractive
LABEL maintainer "Renwu Gao <gilyou.public@gmail.com>"
# NOTE:
#     debian docker with 'latest' tag
#     always points to 'stable' version

# add repository to debian
# note: this is version dependent
# this Dockerfile is for 'stretch'
# if you have different debian version
# change the following 'stretch' to 'your-version'
## change stretch -> stable
RUN echo 'deb http://deb.debian.org/debian/ stable main contrib non-free' >> /etc/apt/sources.list \
    && echo 'deb-src http://deb.debian.org/debian/ stable main contrib non-free' >> /etc/apt/sources.list \
    && echo 'deb http://deb.debian.org/debian/ stable-updates main contrib non-free' >> /etc/apt/sources.list \
    && echo 'deb-src http://deb.debian.org/debian/ stable-updates main contrib non-free' >> /etc/apt/sources.list \
    && echo 'deb http://security.debian.org/ stable/updates main contrib non-free' >> /etc/apt/sources.list \
    && echo 'deb-src http://security.debian.org/ stable/updates main contrib non-free' >> /etc/apt/sources.list \
    && dpkg --add-architecture i386

RUN apt-get update && apt-get install -yq libgl1-nvidia-glx:i386 libgl1-mesa-dri steam-launcher pulseaudio \
	--no-install-recommends \
	&& apt-get install -yq libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 libc6:i386 libnss3:i386 dbus:i386
	&& rm -rf /var/lib/apt/lists/*

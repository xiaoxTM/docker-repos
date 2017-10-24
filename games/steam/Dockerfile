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

RUN aptitude update && aptitude install -yq steam \
	&& rm -rf /var/lib/apt/lists/*

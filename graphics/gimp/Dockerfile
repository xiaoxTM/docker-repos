FROM debian:lates
ENV DEBIAN_FRONTEND noninteractive
LABEL maintainer "Renwu Gao <gilyou.public@gmail.com>"

RUN apt-get update && apt-get install -y \
	gimp dia inkscape blender \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

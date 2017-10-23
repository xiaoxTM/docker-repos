
FROM debian:latest
ENV DEBIAN_FRONTEND noninteractive
LABEL maintainer "Renwu Gao <gilyou.public@gmail.com>"

RUN apt-get update && apt-get install -y \
    vim essential-binutils g++ libgtk-3-dev \
    python3-dev python3-pip libopencv-dev \
    automake autoconf libtool cmake git \
    protobuf-compiler vim emacs 
    libcupti-dev \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
  
RUN python3 -m pip install -U pip && \
    pip3 install -U --no-cache-dir numpy scipy matplotlib \
    scikit-image sklearn pandas networkx \
    git+https://github.com/Theano/Theano.git \
    tensorflow-gpu \
    git+https://github.com/apache/incubator-mxnet.git \
    git+https://github.com/fchollet/keras.git

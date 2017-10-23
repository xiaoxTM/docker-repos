FROM debian:latest
ENV DEBIAN_FRONTEND noninteractive
LABEL maintainer "Renwu Gao <gilyou.public@gmail.com>"

RUN ./run.sh
  
RUN python3 -m pip install -U pip && \
    pip3 install --no-cache-dir numpy scipy matplotlib \
    scikit-image sklearn pandas networkx \
    git+https://github.com/Theano/Theano.git \
    git+https://github.com/tensorflow/tensorflow.git \
    git+https://github.com/apache/incubator-mxnet.git \
    git+https://github.com/fchollet/keras.git

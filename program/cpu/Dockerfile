FROM debian:latest
ENV DEBIAN_FRONTEND noninteractive
LABEL maintainer "Renwu Gao <gilyou.public@gmail.com>"

# install necessary package
RUN apt-get update && apt-get install -y \
    vim build-essential g++ libgtk-3-dev libcanberra-gtk3-module \
    python3 python3-dev python3-pip python3-tk python3-lxml python3-six python3-setuptools \
    pkg-config libswscale-dev libtbb2 \
    libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libavformat-dev libpq-dev \
    automake autoconf libtool cmake git wget \
    protobuf-compiler vim emacs rsync software-properties-common unzip libfreetype6-dev libzmq3-dev \
    --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# install atom
RUN wget https://github-production-release-asset-2e65be.s3.amazonaws.com/3228505/4d6265d0-aeaa-11e7-97a3-60cb2c75b6c0?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20171023%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20171023T232957Z&X-Amz-Expires=300&X-Amz-Signature=b95750bcd2c9ef2d8d995db43e1ab770e6c3a9a8d9889d9044ea2d9fa0fea6aa&X-Amz-SignedHeaders=host&actor_id=11028486&response-content-disposition=attachment%3B%20filename%3Datom-amd64.deb&response-content-type=application%2Foctet-stream \
 && dpkg --install atom-amd64.deb

RUN python3 -m pip install -U pip && \
    pip3 install -U --no-cache-dir numpy scipy matplotlib \
    scikit-image sklearn pandas networkx tensorflow \
 && git+https://github.com/Theano/Theano.git \
    git+https://github.com/apache/incubator-mxnet.git \
    git+https://github.com/fchollet/keras.git

WORKDIR /
RUN git clone https://github.com/opencv/opencv.git \
 && git clone https://github.com/opencv/opencv_contrib.git
RUN mkdir /opencv/cmake_binary
WORKDIR /opencv/cmake_binary
RUN cmake -DBUILD_TIFF=ON \
  -DOPENCV_EXTRA_MODULES_PATH=/opencv_contrib/modules \
  -DBUILD_opencv_java=OFF \
  -DWITH_CUDA=OFF \
  -DENABLE_AVX=ON \
  -DWITH_OPENGL=ON \
  -DWITH_OPENCL=ON \
  -DWITH_IPP=ON \
  -DWITH_TBB=ON \
  -DWITH_EIGEN=ON \
  -DWITH_V4L=ON \
  -DBUILD_TESTS=OFF \
  -DBUILD_PERF_TESTS=OFF \
  -DCMAKE_BUILD_TYPE=RELEASE \
  -DWITH_GTK3=ON \
  -DPYTHON_INCLUDE_DIRS=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
  -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/`ls -l /usr/lib/x86_64-linux-gnu | awk '{print $9}' | grep libpython2.*` \
  -DCMAKE_INSTALL_PREFIX=$(python3 -c "import sys; print(sys.prefix)") \
  -DPYTHON_DEFAULT_EXECUTABLE=$(which python3) \
  -DPYTHON3_EXECUTABLE=$(which python3) \
  -DPYTHON3_INCLUDE_DIRS=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
  -DPYTHON3_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
  -DPYTHON3_LIBRARY=/usr/lib/x86_64-linux-gnu/`ls -l /usr/lib/x86_64-linux-gnu | awk '{print $9}' | grep libpython3.[0-9][m].so$` \
  -DPYTHON3_NUMPY_INCLUDE_DIRS=$(python3 -c "from numpy.distutils import misc_util;print(misc_util.get_numpy_include_dirs()[0])") ..
RUN make -j8 && make install
RUN rm -rf /opencv
RUN rm -rf /opencv_contrib

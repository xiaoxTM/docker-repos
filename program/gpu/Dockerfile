
FROM debian:latest
ENV DEBIAN_FRONTEND noninteractive
LABEL maintainer "Renwu Gao <gilyou.public@gmail.com>"

COPY ../run.sh run.sh
RUN ./run.sh
  
RUN python3 -m pip install -U pip && \
    pip3 install -U --no-cache-dir numpy scipy matplotlib \
    scikit-image sklearn pandas networkx \
    git+https://github.com/Theano/Theano.git \
    tensorflow-gpu \
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
  -DWITH_CUDA=ON \
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

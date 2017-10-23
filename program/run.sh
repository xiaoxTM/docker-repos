# install necessary package
apt-get update && apt-get install -y \
    vim essential-binutils g++ libgtk-3-dev \
    python3-dev python3-pip libopencv-dev \
    automake autoconf libtool cmake git \
    protobuf-compiler vim emacs \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

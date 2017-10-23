# install necessary package
apt-get update && apt-get install -y \
    vim essential-binutils g++ libgtk-3-dev \
    python3-dev python3-pip libopencv-dev \
    automake autoconf libtool cmake git wget \
    protobuf-compiler vim emacs \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
wget https://github-production-release-asset-2e65be.s3.amazonaws.com/3228505/4d6265d0-aeaa-11e7-97a3-60cb2c75b6c0?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20171023%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20171023T232957Z&X-Amz-Expires=300&X-Amz-Signature=b95750bcd2c9ef2d8d995db43e1ab770e6c3a9a8d9889d9044ea2d9fa0fea6aa&X-Amz-SignedHeaders=host&actor_id=11028486&response-content-disposition=attachment%3B%20filename%3Datom-amd64.deb&response-content-type=application%2Foctet-stream
dpkg --install atom-amd64.deb

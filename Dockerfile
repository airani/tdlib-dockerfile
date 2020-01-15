FROM amd64/ubuntu:18.04 AS base

WORKDIR /

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git cmake build-essential gperf libssl-dev zlib1g-dev

RUN git clone https://github.com/tdlib/td.git && \
    cd td && \
    git checkout v1.5.0 && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . && \
    make install
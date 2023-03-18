FROM python:3.9-slim-buster

WORKDIR /

RUN apt update && apt install -y \
    build-essential \
    libtool \
    autoconf \
    unzip \
    wget \
    curl \
    libssl-dev \
    gfortran \
    pkg-config \
    libopenblas-dev 
RUN mkdir ~/temp && cd ~/temp \
    && wget https://cmake.org/files/v3.25/cmake-3.25.0.tar.gz \
    && tar -zxf cmake-3.25.0.tar.gz \
    && cd cmake-3.25.0 \
    && ./bootstrap \
    && make -j$(nproc) \
    && make install
RUN cd ~ && rm -rf temp/
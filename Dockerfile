# MIT License
#
# Copyright (c) 2017 appPlant
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation tasks (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

FROM ubuntu:19.04

LABEL maintainer="katzer@appplant.de"

# libs
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
            bison \
            clang \
            curl \
            git \
            mingw-w64 \
            musl \
            musl-tools \
            openssh-server \
            ruby \
            tar && \
    apt-get clean && apt-get autoremove -y

# rake
RUN echo "gem: --no-document" > ~/.gemrc && \
    gem install rake --force

# osx cross compiling tools
RUN git clone -q --depth=1 https://github.com/tpoechtrager/osxcross.git /opt/osxcross && rm -rf /opt/osxcross/.git && \
    apt-get install -y --no-install-recommends \
            cmake \
            libssl-dev \
            libxml2-dev \
            lzma-dev \
            make \
            patch \
            python \
            wget \
            xz-utils && \
    cd /opt/osxcross && \
    curl -L -o tarballs/MacOSX10.13.sdk.tar.xz https://github.com/phracker/MacOSX-SDKs/releases/download/10.13/MacOSX10.13.sdk.tar.xz && \
    UNATTENDED=1 SDK_VERSION=10.13 USE_CLANG_AS=1 ./build.sh && \
    UNATTENDED=1 MACOSX_DEPLOYMENT_TARGET=10.13 PATH=/opt/osxcross/target/bin:$PATH omp install openssl11 && \
    rm -rf *~ build tarballs/* && \
    apt-get remove -y --auto-remove \
            cmake \
            libssl-dev \
            libxml2-dev \
            lzma-dev \
            make \
            patch \
            python \
            wget \
            xz-utils
ENV PATH /opt/osxcross/target/bin:$PATH
ENV MACOSX_DEPLOYMENT_TARGET 10.13
ENV OSXCROSS_MP_INC 1

# libssl
RUN apt-get install -y --no-install-recommends gnupg1 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 02FE5F12ADDE29B2 && \
    echo "deb http://de.archive.ubuntu.com/ubuntu cosmic-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb http://ppa.launchpad.net/tobydox/mingw-w64/ubuntu bionic main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
            gnupg1 \
            libssl1.0-dev \
            openssl-mingw-w64 && \
    apt-get remove -y --auto-remove \
            gnupg1
ADD libcrypto.so.1.0.0 /lib/x86_64-linux-gnu/libcrypto.so.1.0.0

# sshd
RUN mkdir -p $HOME/.ssh && \
    /etc/init.d/ssh start && \
    ssh-keygen -m PEM -t rsa -q -f $HOME/.ssh/dev.key -N "" && \
    echo `cat $HOME/.ssh/dev.key.pub` >> $HOME/.ssh/authorized_keys && \
    ssh-keygen -m PEM -t rsa -q -f $HOME/.ssh/devp.key -N "phrase" && \
    echo `cat $HOME/.ssh/devp.key.pub` >> $HOME/.ssh/authorized_keys && \
    ssh-keyscan -t ecdsa-sha2-nistp256 localhost >> $HOME/.ssh/known_hosts && \
    echo '/etc/init.d/ssh start' > $HOME/.sshdrc && \
    echo '/etc/init.d/ssh start\neval `ssh-agent -s`\nssh-add $HOME/.ssh/dev.key' > $HOME/.sshrc

# glibc headers
RUN git clone -q --depth=1 https://github.com/wheybags/glibc_version_header.git /opt/glibc && rm -rf /opt/glibc/.git
ENV GLIBC_HEADERS /opt/glibc/version_headers

# mruby utils
RUN gem install mruby_utils:1.4.4

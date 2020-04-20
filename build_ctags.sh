#! /bin/bash

sudo apt-get update 


# from https://docs.ctags.io/en/latest/autotools.html#gnu-linux-distributions

sudo apt install -y \
    git gcc make \
    pkg-config autoconf automake \
    python3-docutils \
    libseccomp-dev \
    libjansson-dev \
    libyaml-dev \
    libxml2-dev

cd /tmp

git clone https://github.com/universal-ctags/ctags.git

cd ctags

./autogen.sh
./configure 
make
sudo make install # may require extra privileges depending on where to install

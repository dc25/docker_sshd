#! /bin/bash

# required because vim-lsp needs a recent version of vim to work correctly.
# testing shows same to be true for neovim also

# see: https://github.com/prabirshrestha/vim-lsp/issues/320

sudo apt-get update 

# taken from vim installs
sudo apt-get install -y \
    git  \
    make  \
    gcc  \
    libncurses5-dev

# additionally needed by neovim
sudo apt-get install -y      \
   cmake                     \
   g++                       \
   pkg-config                \
   unzip                     \
   libtool-bin               \
   libpthread-workqueue-dev  \
   gettext

# taken from vim installs
sudo apt-get install -y \

# change to libncurses-dev when switching to ubuntu 18.10

cd /tmp

git clone https://github.com/neovim/neovim.git

cd neovim
sudo make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

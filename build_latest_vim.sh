#! /bin/bash

# this whole thing is required because vim-lsp needs a recent version of vim to work correctly.
# see: https://github.com/prabirshrestha/vim-lsp/issues/320

sudo apt-get update 

sudo apt-get install -y \
    git  \
    make  \
    gcc  \
    libncurses-dev

# change to libncurses5-dev if using older (pre 18.10 ?) version of ubuntu.

cd /tmp

git clone https://github.com/vim/vim.git

cd vim/src
make distclean
make
sudo make install


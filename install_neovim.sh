#! /bin/bash

# required because vim-lsp needs a recent version of vim to work correctly.
# testing shows same to be true for neovim also

# see: https://github.com/prabirshrestha/vim-lsp/issues/320

sudo apt-get update 

# taken from vim installs
sudo apt-get install -y \
    neovim


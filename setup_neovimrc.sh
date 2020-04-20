#! /bin/bash

touch ~/vimrc

mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
echo so ~/vimrc | tee -a ~/.config/nvim/init.vim

#! /bin/bash

touch ~/vimrc
touch ~/.vimrc

echo so ~/vimrc | tee -a ~/.vimrc


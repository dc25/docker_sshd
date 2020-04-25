#! /bin/bash

sudo apt-get update 
sudo apt-get install -y \
    curl \
    gpg  \
    libxss-dev \
    libasound2-dev \
    libx11-xcb-dev 


export WORKDIR=$HOME/workarea
mkdir -p $WORKDIR
cd $WORKDIR


sh -c "curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg"
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee -a /etc/apt/sources.list.d/vscode.list'

sudo apt-get update
sudo sh -c "export DEBIAN_FRONTEND=noninteractive;apt-get install -y code"




#!/bin/bash

export USER_NAME=$1
export USER_KEY=$2

mkdir -p ~/.ssh
sudo echo $USER_KEY > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

sudo service ssh restart
sleep 100000000000

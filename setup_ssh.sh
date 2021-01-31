#! /bin/bash

#install and configure the sshd server
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update && sudo apt-get install -y \
    openssh-server 

echo "X11UseLocalhost no" | sudo tee -a /etc/ssh/sshd_config
echo "Port 20022" | sudo tee -a /etc/ssh/sshd_config

#set up public key login
mkdir -p ~/.ssh
echo "$1" > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

## create a script to run a program and stay in foreground.
cat << DONE | sudo tee -a /runexec.sh
#!/bin/bash
\$@
sleep 10000000
DONE
sudo chmod 777 /runexec.sh


#! /bin/bash

set -x

export PUBLIC_KEY="$1"

export DEBIAN_FRONTEND=noninteractive

## create a script to run a program and stay in foreground.
cat << DONE | sudo tee -a /runexec.sh
#!/bin/bash
\$@
sleep 10000000
DONE
sudo chmod 777 /runexec.sh

sudo apt-get update && sudo apt-get install -y \
    openssh-server 

echo "X11UseLocalhost no" | sudo tee -a /etc/ssh/sshd_config
echo "Port 20022" | sudo tee -a /etc/ssh/sshd_config

mkdir -p ~/.ssh
echo "$PUBLIC_KEY" > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys


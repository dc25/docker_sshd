FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    net-tools \
    openssh-server \
    sudo \
    tmux 

RUN echo "X11UseLocalhost no" | tee -a /etc/ssh/sshd_config
RUN echo "Port 20022" | sudo tee -a /etc/ssh/sshd_config

COPY runexec.sh  /
RUN chmod 777 /runexec.sh

COPY start.sh  /
RUN chmod 777 /start.sh

ARG user
ARG id
ARG key

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' | tee -a /etc/sudoers
RUN adduser --disabled-password --gecos '' --uid $id $user 
RUN adduser $user sudo 

USER $user

RUN mkdir -p ~/.ssh
RUN echo $key > ~/.ssh/authorized_keys
RUN chmod 600 ~/.ssh/authorized_keys

COPY --chown=$user tmux.conf  /tmp
RUN cp /tmp/tmux.conf ~/.tmux.conf

EXPOSE 20022

# remember for future use; some scripts depend on USER being set
ENV USER $user

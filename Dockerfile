FROM devbase

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    openssh-server 

RUN echo "X11UseLocalhost no" | tee -a /etc/ssh/sshd_config
RUN echo "Port 20022" | sudo tee -a /etc/ssh/sshd_config

COPY runexec.sh  /
RUN chmod 777 /runexec.sh

ARG key

USER $USER

RUN mkdir -p ~/.ssh
RUN echo $key > ~/.ssh/authorized_keys
RUN chmod 600 ~/.ssh/authorized_keys

EXPOSE 20022

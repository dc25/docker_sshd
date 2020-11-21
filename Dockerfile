FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    net-tools \
    openssh-server \
    sudo \
    tmux 

RUN echo "X11UseLocalhost no" | tee -a /etc/ssh/sshd_config

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

##########################################################

COPY --chown=$user install_vim.sh /tmp
RUN /tmp/install_vim.sh

COPY --chown=$user build_latest_vim.sh /tmp
RUN /tmp/build_latest_vim.sh

# COPY --chown=$user install_neovim.sh /tmp
# RUN /tmp/install_neovim.sh

# Building neovim because vim-lsp "signs" work better with later version.
# Saw this both in rust and haskell.
COPY --chown=$user build_latest_neovim.sh /tmp
RUN /tmp/build_latest_neovim.sh

COPY --chown=$user setup_vimrc.sh /tmp
RUN /tmp/setup_vimrc.sh

COPY --chown=$user setup_neovimrc.sh /tmp
RUN /tmp/setup_neovimrc.sh

COPY --chown=$user build_ctags.sh /tmp
RUN /tmp/build_ctags.sh

COPY --chown=$user devbaseVimrc /tmp
RUN cp /tmp/devbaseVimrc ~
RUN echo so ~/devbaseVimrc | tee -a ~/vimrc

COPY --chown=$user install_vscode.sh /tmp
RUN /tmp/install_vscode.sh

# remember for future use; some scripts depend on USER being set
ENV USER $user

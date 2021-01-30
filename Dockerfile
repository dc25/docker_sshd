FROM rust
ARG key
EXPOSE 20022
COPY --chown=$USER setup_ssh.sh  /tmp
RUN /tmp/setup_ssh.sh "$key"


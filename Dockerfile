ARG base=devbase
FROM "$base"
ARG key
EXPOSE 20022
COPY --chown=$USER setup_ssh.sh  /tmp
RUN chmod 777 /tmp/setup_ssh.sh
RUN /tmp/setup_ssh.sh "$key"


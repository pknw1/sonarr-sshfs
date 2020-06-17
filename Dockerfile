FROM linuxserver/sonarr


# install packages
RUN apt update && apt install -y sshfs

# add local files
COPY /root /

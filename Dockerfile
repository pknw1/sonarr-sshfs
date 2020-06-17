FROM linuxserver/sonarr


# install packages
#RUN apt update && apt install -y sshfs
RUN apt update && apt install -y cifs-utils

# add local files
COPY /root /

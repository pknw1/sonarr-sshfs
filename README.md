# sonarr-sshfs

[Base Image from Linuxserver.io](https://hub.docker.com/r/linuxserver/sonarr)

## About

This image simply takes the Linuxserver.io base image and adds a few things

- [X] installs sshfs and dependencies
- [X] runs a script at container creation 
  - echo's the SSH environment variable into a local file /root/.ssh/id_rsa
  - changes the permission of the file for sshfs
  - runs sshfs to a hardcoded account 
 
#### Encoding your SSH key 

you will need to encode your private key for the connection into base64 with linewrap=0

```
	SSH=$(cat ~/.ssh/id_rsa | base64 -w0)
```

#### Running the container 

```
docker create \
  --name=sonarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e UMASK_SET=022 `#optional` \
  -p 8989:8989 \
  -e SSH="YOUR SSH PRIVATE KEY encoded by echo ~/.ssh/id_rsa | base64 -w0"
  --restart unless-stopped \
  linuxserver/sonarr
  
  ```
  
  
### TODO  
   
I will be updating the following

- [ ] environment variable defining the connection user
- [ ] environment variable defining the connection host
- [ ] environment variable defining the mount point
- [ ] test various methods for stroing and retrieving /config


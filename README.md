# docker-repos
docker repositories

## Docker with GUI
To run docker with GUI, we need XForwarding.
- Enable socket communication between host and container
- Certification for each other
```bash
SOCKET=/tmp/.X11-unix
# get container id
containerid=`docker run -it --rm -d -v $SOCKET:$SOCKET -e DISPLAY:$DISPLAY $IMAGE:$TAGS bash`
# certificate
xhost +local:$containerid
# do your work here
docker exec -it $containerid $COMMEND
# stop container
docker stop $containerid
# un-certificate for better security
xhost -local:$containerid
```

# User Documentation

## Services

## Quick start / stop guide

docker build -t "image-name" : create a Docker image from a Dockerfile

docker run -d "image-name" : launch the container
-d : detach the container from our terminal and run it in the background
run -it : add an interactive shell
run --rm -it : removes the container when it exits
--name "name" : give a name
-P : publish all exposed ports to random ports
-p port:port : to specify a custom port to which the client will forward connections to the container
if image not exist locally, the client will first fetch the image

dockes ps : list running containers and provide infos
docker rename "container name" "new name"

docker exec -it "container-name" sh : start an interactive shell inside a container
-i : input open
-t : create pseudo terminal the shell can attach
--user "user-name" : run a command as a different user inside the container
(exit with "exit")

docker stop "container-name" / docker start : control the container lifecycle

docker logs : get logs

docker port "container-name" : see the ports

docker images : list of locally available images (TAG = snashot)

docker search : search for images directly from the command line


docker network create "network-name" (bridge is the default network)

docker compose up : démarre tout, ^ C pour arreter tout
docker compose down : stoppe les containers et supprime les réseaux créés

## Website and administration pannel

## Credentials

## Services

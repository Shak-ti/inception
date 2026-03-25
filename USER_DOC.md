# User Documentation

## Services

## Quick start / stop guide

docker build -t "image-name"

docker run -d "image-name" : launch the container
-d : detach the container from our terminal and run it in the background
run -it : add an interactive shell


dockes ps : list running containers and provide infos
docker rename "container name" "new name"

docker exec -it "container-name" sh : start an interactive shell inside a container
-i : input open
-t : create pseudo terminal the shell can attach
--user "user-name" : run a command as a different user inside the container
(exit with "exit")


docker compose up : démarre tout, ^ C pour arreter tout
docker compose down : stoppe les containers et supprime les réseaux créés

## Website and administration pannel

## Credentials

## Services

# syntax=docker/dockerfile:1
# (optional, but this line instructs tho Docker builder what syntax to use when parsing the Dockerfile)

# base image, can be found on docker hub
# FROM image + tag car sinon ça prend d'office le latest, on veut fixer la version
FROM debian:12

# environment setup
# chaque RUN crée un nouveau layer donc faire apt-get blabla && rm -rf fichiersinutiles ou alors multistage build
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server netcat

# Set a working directory for any RUN, CMD, ENTRYPOINT, COPY, and ADD instructions that follow
WORKDIR /bin

# Copy src to dest (relative to the workdir)
# add .dockerignore file to ignore what we dont want
COPY ./tools/script.sh .

# run commands from inside the workdir folder
RUN chmod +x script.sh

# EXPOSE marks that our final image has a service listening on port 3306 (not required but good practice)
EXPOSE 3306

# CMD lets you define the default program that is run once you start the container based on this image
# only one CMD per Dockerfile
# Launch "sh script.sh" command when the container start
# CMD ["sh", "script.sh"]

ENTRYPOINT [ "./script.sh" ]

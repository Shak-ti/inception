# syntax=docker/dockerfile:1

FROM debian:12

RUN apt update -y && apt upgrade -y
RUN apt install -y wordpress

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

WORKDIR /bin

COPY ./tools/script.sh .

RUN chmod +x script.sh

EXPOSE 9000

ENTRYPOINT [ "./script.sh" ]

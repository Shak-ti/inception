# syntax=docker/dockerfile:1

FROM debian:12

RUN apt update -y && apt upgrade -y
RUN apt install -y nginx openssl
RUN mkdir -p /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

ENTRYPOINT [ "./script.sh" ]

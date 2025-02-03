FROM debian:bullseye

RUN apt update && apt install -y redis-server

WORKDIR /var/www/wordpress

CMD ["redis-server", "--protected-mode", "no"]
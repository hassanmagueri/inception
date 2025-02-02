FROM debian:11

RUN apt update && apt upgrade -y && apt install nginx openssl curl vim -y

COPY ./config/nginx.conf /etc/nginx/nginx.conf
COPY ./config/init_nginx.sh /usr/local/bin

RUN chmod +x /usr/local/bin/init_nginx.sh

EXPOSE 443

CMD ["init_nginx.sh"] 
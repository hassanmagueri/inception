FROM debian:12.8

RUN apt update && apt upgrade -y && apt install nginx openssl curl vim systemctl -y


COPY ./config/nginx.conf /etc/nginx/nginx.conf
COPY ./config/PortfolioWebsite/ /usr/share/nginx/html/

EXPOSE 3030

CMD ["nginx", "-g", "daemon off;"]
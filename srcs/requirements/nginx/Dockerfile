FROM debian:12.8

RUN apt update && apt upgrade -y && apt install nginx openssl curl vim systemctl -y

RUN mkdir -p /ssl
RUN openssl req -x509 -newkey rsa:4096 \
    -keyout /ssl/key.pem -out /ssl/cert.pem -sha256 -days 365 -nodes \
    -subj "/C=XX/L=CityName/O=CompanyName/CN=localhost"


COPY ./tools/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/index.html /usr/share/nginx/html/index.html

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
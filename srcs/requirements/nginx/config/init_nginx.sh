#! /bin/bash

mkdir -p /ssl

openssl req -x509 -newkey rsa:4096 \
    -keyout /ssl/key.pem -out /ssl/cert.pem -sha256 -days 365 -nodes \
    -subj "/C=$SSL_COUNTRY/L=$SSL_CITY/O=$SSL_COMPANY/CN=$URL"

nginx -g "daemon off;"
FROM debian:11

RUN apt update && apt upgrade -y && apt install php -y


COPY ./config/index.html /usr/share/nginx/html/

EXPOSE 3030

CMD ["php", "-S", "0.0.0.0:3030", "/usr/share/nginx/html/index.html"]
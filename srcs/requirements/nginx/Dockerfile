FROM debian:12.8

RUN apt update && apt upgrade -y && apt install nginx vim -y

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
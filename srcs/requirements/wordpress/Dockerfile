FROM debian:11


RUN apt update && apt install -y php7.4-fpm php7.4-mysql mariadb-client php7.4-redis curl

COPY  ./conf/init_wp.sh /usr/bin/
RUN chmod +x /usr/bin/init_wp.sh
RUN mkdir -p /var/www/wordpress


WORKDIR /var/www/wordpress
EXPOSE 9000
CMD ["init_wp.sh"]
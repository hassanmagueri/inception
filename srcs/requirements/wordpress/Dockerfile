FROM debian:11.11

RUN apt update && apt install -y curl

RUN apt update && apt install -y php7.4-fpm php7.4-mysql vim sudo

COPY  ./conf/init_wp.sh /usr/bin/
RUN chmod +x /usr/bin/init_wp.sh
RUN mkdir -p /var/www/wordpress

# RUN chmod -R 755 /var/www/WordPress

WORKDIR /var/www/wordpress
EXPOSE 9000
CMD ["init_wp.sh"]
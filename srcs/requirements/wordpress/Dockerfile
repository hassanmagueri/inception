FROM debian:11.11

# RUN apt update && apt install -y curl vim procps redis-tools sudo

RUN apt update && apt install -y php7.4-fpm php7.4-mysql php7.4-redis curl
COPY  ./conf/init_wp.sh /usr/bin/
RUN chmod +x /usr/bin/init_wp.sh
RUN mkdir -p /var/www/wordpress

# RUN chmod -R 755 /var/www/WordPress

WORKDIR /var/www/wordpress
EXPOSE 9000
CMD ["init_wp.sh"]
# CMD ["tail", "-f", "/dev/null"]
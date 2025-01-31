FROM debian:11

RUN apt update && apt install -y redis-server

COPY ./config/init_redis.sh /usr/local/bin/

RUN chmod 777 /usr/local/bin/init_redis.sh

EXPOSE 6379

WORKDIR /var/www/wordpress

CMD ["/usr/local/bin/init_redis.sh"]
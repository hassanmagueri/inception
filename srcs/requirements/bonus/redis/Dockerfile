FROM debian:11

# RUN apt update && apt install -y curl vim procps

RUN apt update && apt install -y redis-server

# RUN mkdir -p /var/www/WordPress
COPY ./config/init_redis.sh /usr/local/bin/

RUN chmod 777 /usr/local/bin/init_redis.sh

EXPOSE 6379

WORKDIR /var/www/wordpress

CMD ["/usr/local/bin/init_redis.sh"]
# CMD ["redis-server", "--bind", "0.0.0.0", "--protected-mode", "no", "--requirepass", "$REDIS_PASS"]
# CMD ["redis-server", "--bind", "0.0.0.0", "--protected-mode", "no"]
# ?? error here


# CMD ["tail", "-f", "/dev/null"]

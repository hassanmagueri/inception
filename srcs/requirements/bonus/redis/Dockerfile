FROM debian:11

RUN apt update && apt install -y redis-server

EXPOSE 6379

RUN  echo "maxmemory 256mb" >> /etc/redis/redis.conf

RUN echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

WORKDIR /var/www/wordpress

CMD ["redis-server", "--bind", "0.0.0.0", "--protected-mode", "no"]
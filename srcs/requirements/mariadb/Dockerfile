FROM debian:11

RUN apt update && apt upgrade -y && apt install mariadb-server mariadb-client curl vim -y

COPY config/init_mariadb.sh /usr/local/bin
RUN chmod +x /usr/local/bin/init_mariadb.sh

EXPOSE 3306

CMD ["init_mariadb.sh"]
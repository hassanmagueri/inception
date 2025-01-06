FROM debian:12.8

RUN apt update && apt upgrade -y && apt install mariadb-server mariadb-client curl vim systemctl -y

# Create the required directory for the socket

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql && chmod -R 755 /var/lib/mysql

# RUN chown -R mysql:mysql /var/lib/mysql
# RUN chmod -R 755 /var/lib/mysql


COPY config/my.cnf /etc/mysql/my.cnf
# COPY config/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY config/init_mariadb.sh /tmp

EXPOSE 3306


CMD ["/tmp/init_mariadb.sh"]
# CMD ["tail", "-f", "/dev/null"]

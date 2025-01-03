FROM debian:12.8

RUN apt update && apt upgrade -y && apt install mariadb-server mariadb-client curl vim systemctl -y

# Create the required directory for the socket
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

COPY config/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY config/init.sql /tmp

RUN  service mariadb start && mysql < /tmp/init.sql && hostname -I

EXPOSE 3306

CMD ["mariadbd"]



# CREATE USER 'aa'@'%' IDENTIFIED BY 'aa';
# GRANT ALL PRIVILEGES ON *.* TO 'aa'@'%' WITH GRANT OPTION;
# FLUSH PRIVILEGES;
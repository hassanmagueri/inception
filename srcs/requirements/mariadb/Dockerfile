FROM debian:12.8

RUN apt update && apt upgrade -y && apt install mariadb-server mariadb-client curl vim systemctl -y

# Create the required directory for the socket
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

COPY config/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY config/init_mariadb.sh /tmp

# RUN service mariadb start 

EXPOSE 3306

# RUN sh /tmp/init_mariadb.sh

# CMD ["mariadbd"]
CMD ["sh", "/tmp/init_mariadb.sh"]



# CREATE USER 'aa'@'%' IDENTIFIED BY 'aa';
# GRANT ALL PRIVILEGES ON *.* TO 'aa'@'%' WITH GRANT OPTION;
# FLUSH PRIVILEGES;
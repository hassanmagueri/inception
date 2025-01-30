#!/bin/bash



service mariadb start; # start the service in background
sleep 1;
mysql -u root -e "CREATE DATABASE $DB_NAME"
# mysql -u root  -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'"
mysql -u root  -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$(cat /run/secrets/db_pass)'"
mysql -u root  -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION"
mysql -u root  -e "FLUSH PRIVILEGES"
service mariadb stop
mysqld_safe --port=3306 --bind-address=0.0.0.0

#!/bin/bash

mkdir -p /run/php

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/bin/wp

sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf #?



wp core download  --allow-root
wp config create \
    --dbname=$DB_NAME --dbuser=$DB_USER --dbpass="$(cat /run/secrets/db_pass)" --dbhost=$DB_HOST  --allow-root

wp core install --url="$URL" --title="$WP_ADMIN_SITETITLE" --admin_user="$WP_ADMIN_NAME" --admin_password="$(cat /run/secrets/wp_admin_pass )" --admin_email="$WP_ADMIN_EMAIL"  --allow-root

wp user create $WP_USER_NAME $WP_USER_EMAIL --role=$WP_USER_ROLE --user_pass="$(cat /run/secrets/wp_user_pass )" --allow-root

# redis

wp plugin install redis-cache --allow-root

wp plugin activate redis-cache --allow-root 

wp config set WP_REDIS_HOST "redis" --allow-root 
wp config set WP_REDIS_PORT 6379 --allow-root

wp redis enable --allow-root 
``
chown -R www-data:www-data /var/www/wordpress

php-fpm7.4 -F
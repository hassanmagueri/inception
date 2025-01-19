#!/bin/bash
sleep 3
mkdir -p /run/php

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/bin/wp

sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf



wp core download  --allow-root
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST  --allow-root

wp core install --url="$WP_ADMIN_URL" --title="$WP_ADMIN_SITETITLE" --admin_user="$WP_ADMIN_NAME" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_EMAIL"  --allow-root

wp user create $WP_USER_NAME $WP_USER_EMAIL --role=$WP_USER_ROLE --user_pass=$WP_USER_PASS --allow-root

# redis


wp plugin install redis-cache --allow-root

wp plugin activate redis-cache --allow-root

wp config set WP_REDIS_HOST "redis" --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
wp config set WP_REDIS_PASSWORD $REDIS_PASS --allow-root

wp redis enable --allow-root

chown -R www-data:www-data /var/www/wordpress

php-fpm7.4 -F
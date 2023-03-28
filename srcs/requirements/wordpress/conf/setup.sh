#!/bin/sh

mkdir -p /var/www/html/

cd /var/www/html

wp core download --locale=es_ES --allow-root

wp --path=/var/www/html config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --locale=es_ES --allow-root --skip-check

wp core install --path=/var/www/html  --url=${DOMAIN_NAME} --title="Sabes que en LLeida dicen la A con fonetica de E" --admin_name=${WP_ADMIN} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email="jofernan@student.42urduliz.com" --skip-email --allow-root

#wp --path=/var/www/html theme install https://downloads.wordpress.org/theme/twentytwentythree.1.0.zip --allow-root

#wp --path=/var/www/html theme activate twentytwenty --allow-root
wp --path=/var/www/html theme install https://downloads.wordpress.org/theme/photobrust.1.0.1.zip --allow-root
wp --path=/var/www/html theme activate photobrust --allow-root

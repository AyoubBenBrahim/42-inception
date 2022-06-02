#!/bin/sh

sed -i "s/database_name_here/$DB_NAME/g" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/$DB_USER/g" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/$DB_PASSWORD/g" /var/www/html/wordpress/wp-config.php
sed -i "s/localhost/$DB_HOST/g" /var/www/html/wordpress/wp-config.php

sleep 5
wp core install --url=https://localhost/ --title='inception' --admin_user=$WP_ADMIN_USER --admin_email=boss@1337.com --admin_password=$WP_ADMIN_USER_PASSWORD --path=/var/www/html/wordpress --allow-root 
wp user create $WP_USER user@gmail.com --role=subscriber  --user_pass=$WP_USER_PASSWORD  --path=/var/www/html/wordpress  --allow-root 

php-fpm7.3 --nodaemonize

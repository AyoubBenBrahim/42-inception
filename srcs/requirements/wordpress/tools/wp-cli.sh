#!/bin/sh

wp core install --url=https://localhost/ --title='inception' --admin_user=$WP_ADMIN_USER --admin_email=boss@1337.com --admin_password=$WP_ADMIN_USER_PASSWORD --path=/var/www/html/wordpress --allow-root 
wp user create $WP_USER user@gmail.com --role=subscriber  --user_pass=$WP_USER_PASSWORD  --path=/var/www/html/wordpress  --allow-root 
# wp theme install galaxis --activate --path=/var/www/html/wordpress --allow-root
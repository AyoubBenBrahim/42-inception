#!/bin/sh

# while ! mariadb -h 127.0.0.1 -P${DB_PORT} -u$DB_USER -p$DB_PASSWORD; do echo "waiting for mariadb ..."; done
# until mariadb -h mariadb -P${DB_PORT} -u$DB_USER -p$DB_PASSWORD -e '\c'; do
#   echo >&2 "mariadb is unavailable - sleeping"
#   sleep 1
# done

sed -i "s/database_name_here/$DB_NAME/g" /var/www/wordpress/wp-config.php
sed -i "s/username_here/$DB_USER/g" /var/www/wordpress/wp-config.php
sed -i "s/password_here/$DB_PASSWORD/g" /var/www/wordpress/wp-config.php
sed -i "s/localhost/$DB_HOST/g" /var/www/wordpress/wp-config.php

echo " \n // **** Redis Connection Parameters **** \n\n
define( 'WP_REDIS_HOST', 'redis'); \n
define( 'WP_REDIS_PORT', 6379 ); \n
define( 'WP_REDIS_TIMEOUT', 1 ); \n
define( 'WP_REDIS_READ_TIMEOUT', 1 ); \n
define( 'WP_REDIS_DATABASE', 0 ); \n " >> /var/www/wordpress/wp-config.php

sleep 5

# cp /var/www/wordpress/wp-content/plugins/redis-cache/includes/object-cache.php /var/www/wordpress/wp-content/object-cache.php


wp core install --url=https://localhost/ --title='inception' --admin_user=$WP_ADMIN_USER --admin_email=1337@1337.ma --admin_password=$WP_ADMIN_USER_PASSWORD --path=/var/www/wordpress --allow-root 
wp user create $WP_USER inception123@gmail.com --role=subscriber  --user_pass=$WP_USER_PASSWORD  --path=/var/www/wordpress  --allow-root 

wp plugin install redis-cache --path=/var/www/wordpress --allow-root  --activate
# wp plugin redis enable --path=/var/www/wordpress --allow-root 
wp theme install twentytwenty --path=/var/www/wordpress  --allow-root  --activate 
# wp plugin update --path=/var/www/wordpress  --allow-root  --all

wp redis update-dropin --path=/var/www/wordpress  --allow-root  --all
wp redis enable

wp user create 1337 --role=author --user_pass=1337 --path=/var/www/wordpress  --allow-root 
wp post create --post_title="Hello World !" --post_content="Hi from 1337 , coding school from Morocco" --post_status=publish --post_author="1337" --path=/var/www/wordpress  --allow-root 

php-fpm7.3 --nodaemonize

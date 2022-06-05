#!/bin/sh

sed -i "s/database_name_here/$DB_NAME/g" /var/www/wordpress/wp-config.php
sed -i "s/username_here/$DB_USER/g" /var/www/wordpress/wp-config.php
sed -i "s/password_here/$DB_PASSWORD/g" /var/www/wordpress/wp-config.php
sed -i "s/localhost/$DB_HOST/g" /var/www/wordpress/wp-config.php

# echo " \n // **** Redis Connection Parameters **** \n\n
# define( 'WP_REDIS_HOST', 'redis'); \n
# define( 'WP_REDIS_PORT', 6379 ); \n
# define( 'WP_REDIS_TIMEOUT', 1 ); \n
# define( 'WP_REDIS_READ_TIMEOUT', 1 ); \n
# define( 'WP_REDIS_DATABASE', 0 ); \n " >> /var/www/wordpress/wp-config.php

sleep 5

wp core install --url=https://localhost/ --title='inception' --admin_user=$WP_ADMIN_USER --admin_email=1337@1337.ma --admin_password=$WP_ADMIN_USER_PASSWORD --path=/var/www/wordpress --allow-root 
wp user create $WP_USER inception123@gmail.com --role=subscriber  --user_pass=$WP_USER_PASSWORD  --path=/var/www/wordpress  --allow-root 

php-fpm7.3 --nodaemonize

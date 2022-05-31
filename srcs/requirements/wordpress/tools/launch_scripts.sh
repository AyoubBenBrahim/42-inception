#!/bin/sh

sh /var/www/html/scripts/update_php_ini.sh
sh /var/www/html/scripts/update_wp-config.sh
# sh /var/www/html/scripts/update_pool_conf.sh
# php-fpm7.3 --nodaemonize
service php7.3-fpm start

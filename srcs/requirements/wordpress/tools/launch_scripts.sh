#!/bin/sh

sh /var/www/html/scripts/update_php_ini.sh
sh /var/www/html/scripts/update_wp-config.sh
sh /var/www/html/scripts/update_pool_conf.sh

service php7.3-fpm start

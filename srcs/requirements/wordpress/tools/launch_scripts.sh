#!/bin/sh

sh /var/www/html/scripts/update_php_ini.sh
sh /var/www/html/scripts/update_wp-config.sh
sh /var/www/html/scripts/update_pool_conf.sh


sleep 6
sh /var/www/html/scripts/wp-cli.sh

service php7.3-fpm start

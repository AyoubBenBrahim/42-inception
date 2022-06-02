#!/bin/sh

sh /var/www/html/scripts/update_pool_conf.sh
sh /var/www/html/scripts/update_wp-config.sh
sh /var/www/html/scripts/update_php_ini.sh



sh /var/www/html/scripts/wp-cli.sh

service php7.3-fpm start # works with sleep


# /usr/sbin/php-fpm7.3 --nodaemonize --allow-to-run-as-root

#!/bin/sh
sed -i "s/post_max_size =.*/post_max_size = 64M/g" /etc/php/7.3/fpm/php.ini
sed -i "s/memory_limit =.*/memory_limit = 256M/g" /etc/php/7.3/fpm/php.ini
sed -i "s/max_execution_time =.*/max_execution_time = 300/g" /etc/php/7.3/fpm/php.ini
sed -i "s/upload_max_filesize =.*/upload_max_filesize = 32M/g" /etc/php/7.3/fpm/php.ini
sed -i "s/;date.timezone =.*/date.timezone = Africa\/Casablanca/g" /etc/php/7.3/fpm/php.ini
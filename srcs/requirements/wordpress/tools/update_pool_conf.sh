#!/bin/sh

sed -i 's/;listen.allowed_clients = 127.0.0.1/listen.allowed_clients = 0.0.0.0:9000/' /etc/php/7.3/fpm/pool.d/www.conf
# sed -i 's/user = www-data/user = root/' /etc/php/7.3/fpm/pool.d/www.conf
# sed -i 's/group = www-data/group = root/' /etc/php/7.3/fpm/pool.d/www.conf
# sed -i 's/listen.owner = www-data/listen.owner = root/' /etc/php/7.3/fpm/pool.d/www.conf
# sed -i 's/listen.group = www-data/listen.group = root/' /etc/php/7.3/fpm/pool.d/www.conf


FROM debian:buster

ARG BUILD_DATE
LABEL version="1.0" \
	description="This Is an Adminer Image" \
	maintainer="ayoub@gmail.com" \
	build-date=${BUILD_DATE}

RUN apt-get update \
	&& apt-get upgrade -y \
	php-cgi php-common php-fpm php-pear php-mbstring \
	php-zip php-net-socket php-gd php-xml-util \
	php-gettext php-mysql php-bcmath wget

RUN mkdir -p /var/www/adminer

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php -O /var/www/adminer/adminer.php

RUN mkdir /run/php/
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 7000/g' /etc/php/7.3/fpm/pool.d/www.conf

ENTRYPOINT php-fpm7.3 --nodaemonize

# https://localhost:8080/adminer.php
# FROM debian:buster AS build-stage

# RUN apt-get update \
# 	&& apt-get upgrade -y \
# 	&& apt-get install vim curl unzip wget git -y 



# WORKDIR /var/www/
# RUN wget http://wordpress.org/latest.tar.gz \
# 	&& tar -xzvf latest.tar.gz && rm -rf latest.tar.gz \
# 	&& cp ./wordpress/wp-config-sample.php ./wordpress/wp-config.php \
# 	&& apt-get autoclean && apt-get autoremove

# WORKDIR  /var/www/wordpress

# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
# RUN chmod +x /var/www/wordpress/wp-cli.phar

FROM debian:buster AS final-stage

ARG BUILD_DATE
LABEL version="1.0" \
	description="This Is a wordpress Image" \
	maintainer="ayoub@gmail.com" \
	build-date=${BUILD_DATE}

RUN apt-get update \
	&& apt-get upgrade -y \
	php-cgi php-common php-fpm php-pear php-mbstring \
	php-zip php-net-socket php-gd php-xml-util \
	php-gettext php-mysql php-bcmath vim curl unzip wget git -y 

# COPY --from=build-stage /var/ /var/

# WORKDIR /var/www/
RUN wget http://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz && rm -rf latest.tar.gz \
	&& cp ./wordpress/wp-config-sample.php ./wordpress/wp-config.php \
	&& apt-get autoclean && apt-get autoremove
RUN mkdir -p /var/www/wordpress
RUN cp -r /wordpress/* /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress
# WORKDIR  /var/www/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x ./wp-cli.phar
RUN mv ./wp-cli.phar /usr/local/bin/wp

# RUN mkdir scripts
COPY ./tools/*.sh /
RUN chmod +x /*.sh
# RUN mkdir -p /var/www/wordpress
# RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php -O /var/www/wordpress/adminer.php

RUN mkdir /run/php/
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT sh /launch_wp_script.sh





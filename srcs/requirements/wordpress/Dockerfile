FROM debian:buster AS build-stage

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install vim curl unzip wget git -y 
# php-cgi php-common php-fpm php-pear php-mbstring \
# php-zip php-net-socket php-gd php-xml-util \
# php-gettext php-mysql php-bcmath -y \
# 	&& apt-get autoclean && apt-get autoremove

RUN mkdir scripts
COPY ./tools/* ./scripts/
RUN chmod +x /scripts/*.sh

RUN mkdir -p /var/www/html \
	&& chmod 777 /var/www/html \
	&& mv ./scripts /var/www/html/
# && sh /var/www/html/scripts/update_php_ini.sh

#	&& chown -R www-data:www-data /var/www/html/

WORKDIR /var/www/html
RUN wget http://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz && rm -rf latest.tar.gz \
	# && tar -xzvf latest.tar.gz && rm -rf latest.tar.gz && cp -Rf wordpress/* . \
	# && rm -rf wordpress \
	&& cp ./wordpress/wp-config-sample.php ./wordpress/wp-config.php \
	&& apt-get autoclean && apt-get autoremove


#WORKDIR /

FROM debian:buster AS final-stage

ARG BUILD_DATE

LABEL version="1.0" \
	description="This Is a wordpress Image" \
	maintainer="ayoubbrs@gmail.com" \
	build-date=${BUILD_DATE}

RUN apt-get update \
	&& apt-get upgrade -y \
	php-fpm php-mysql curl

COPY --from=build-stage /var/ /var/

EXPOSE 9000

# RUN sh /var/www/html/scripts/update_php_ini.sh \
# 	sh /var/www/html/scripts/update_wp-config.sh \
# 	sh /var/www/html/scripts/update_pool_conf.sh


RUN chown -R www-data:www-data /var/www/html/wordpress

# RUN sh /var/www/html/scripts/update_pool_conf.sh \
# 	sh /var/www/html/scripts/update_wp-config.sh \
# 	sh /var/www/html/scripts/update_php_ini.sh
	

# RUN chmod +x /var/www/html/scripts//*.sh

# RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# RUN sh /var/www/html/scripts/launch_scripts.sh

WORKDIR  /var/www/html/wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x /var/www/html/wordpress/wp-cli.phar
RUN mv /var/www/html/wordpress/wp-cli.phar /usr/local/bin/wp

WORKDIR  /

ENTRYPOINT sh /var/www/html/scripts/launch_scripts.sh && sleep 800
# ENTRYPOINT sh /var/www/html/scripts/launch_scripts.sh





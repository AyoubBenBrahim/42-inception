FROM debian:buster AS build-stage

RUN apt-get update \
   && apt-get upgrade -y \
   && apt-get install vim curl unzip wget git -y \
	php-cgi php-common php-fpm php-pear php-mbstring \
	php-zip php-net-socket php-gd php-xml-util \
	php-gettext php-mysql php-bcmath -y

RUN mkdir scripts
COPY ./tools/* ./scripts/
RUN chmod +x /scripts/*.sh \
	&& sh /scripts/update_php_ini.sh

RUN mkdir -p /var/www/html \
	&& chmod 777 /var/www/html 
#	&& chown -R www-data:www-data /var/www/html/

WORKDIR /var/www/html
RUN wget http://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz && rm -rf latest.tar.gz && cp -Rf wordpress/* . \
	&& rm -rf wordpress \
	&& cp wp-config-sample.php wp-config.php \
	&& sh /scripts/update_wp-config.sh 
#	&& chown -R www-data:www-data /var/www/html/
	
#RUN cp -rf  /wp-config.php /var/www/html

#WORKDIR /

ENTRYPOINT ["sleep", "600"]
   
   




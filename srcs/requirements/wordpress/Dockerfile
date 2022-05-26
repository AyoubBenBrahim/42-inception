FROM debian:buster AS build-stage

RUN apt-get update \
   && apt-get upgrade -y \
   && apt-get install vim curl unzip wget git -y \
	php-cgi php-common php-fpm php-pear php-mbstring \
	php-zip php-net-socket php-gd php-xml-util \
	php-gettext php-mysql php-bcmath -y

RUN mkdir scripts
COPY ./tools/* ./scripts/
RUN chmod +x /scripts/*.sh 
	# && sh /scripts/update_php_ini.sh

RUN mkdir -p /var/www/html \
	&& chmod 777 /var/www/html \
	&& mv ./scripts /var/www/html/ \
	&& sh /var/www/html/scripts/update_php_ini.sh

#	&& chown -R www-data:www-data /var/www/html/

WORKDIR /var/www/html
RUN wget http://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz && rm -rf latest.tar.gz && cp -Rf wordpress/* . \
	&& rm -rf wordpress \
	&& cp wp-config-sample.php wp-config.php
#	&& chown -R www-data:www-data /var/www/html/
	

#WORKDIR /

FROM debian:buster AS final-stage

LABEL version="1.0"
LABEL description="This Is a wordpress Image"
LABEL maintainer="ayoubbrs@gmail.com"
ARG BUILD_DATE
LABEL build-date=${BUILD_DATE}



COPY --from=build-stage /my_certs/* /etc/ssl/
COPY --from=build-stage /etc/nginx /etc/nginx/


ENTRYPOINT sh /var/www/html/scripts/update_wp-config.sh

#ENTRYPOINT ["sleep", "600"]
   
   




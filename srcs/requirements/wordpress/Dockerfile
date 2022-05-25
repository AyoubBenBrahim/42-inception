FROM debian:buster AS build-stage

RUN apt-get update \
   && apt-get upgrade -y \
   && apt-get install vim curl unzip wget git -y \
	php-cgi php-common php-fpm php-pear php-mbstring \
	php-zip php-net-socket php-gd php-xml-util \
	php-gettext php-mysql php-bcmath -y

RUN mkdir scripts
COPY ./tools/* ./scripts
RUN chmod +x /scripts/*.sh \
	&& sh /scripts/update_php_ini.sh






ENTRYPOINT ["sleep", "600"]
   
   




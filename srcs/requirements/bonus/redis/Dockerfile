FROM debian:buster 

RUN apt-get  update \
    && apt-get upgrade -y \
    && apt-get install redis-server php-redis wget  -y


# WORKDIR /var/www/html
# RUN wget http://download.redis.io/redis-stable.tar.gz \
# 	&& tar xvzf redis-stable.tar.gz && rm -rf redis-stable.tar.gz \
# 	&& apt-get autoclean && apt-get autoremove

RUN wget http://download.redis.io/redis-stable.tar.gz \
	&& tar xvzf redis-stable.tar.gz
RUN cp -Rf redis-stable /www/wordpress/wp-content/plugins/

ENTRYPOINT redis-server --protected-mode no

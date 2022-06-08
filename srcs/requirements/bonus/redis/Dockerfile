FROM debian:buster 

RUN apt-get  update \
    && apt-get upgrade -y \
    && apt-get install redis-server php-redis wget  -y


# WORKDIR /var/www/html
# RUN wget http://download.redis.io/redis-stable.tar.gz \
# 	&& tar xvzf redis-stable.tar.gz && rm -rf redis-stable.tar.gz \
# 	&& apt-get autoclean && apt-get autoremove

# RUN wget http://download.redis.io/redis-stable.tar.gz \
# 	&& tar xvzf redis-stable.tar.gz
# # RUN cp -Rf redis-stable var/www/wordpress/wp-content/plugins/
# RUN mv redis-stable /var/www/wordpress/wp-content/plugins/

# change some settings in conf file
# 

# sed -i "s|bind 127.0.0.1|# bind 127.0.0.1|g" /etc/redis/redis.conf \
RUN sed -i "s|bind 127.0.0.1| bind 0.0.0.0|g" /etc/redis/redis.conf \
    && sed -i "s|# maxmemory <bytes>|maxmemory 256mb|g" /etc/redis/redis.conf \
    && sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lfu|g" /etc/redis/redis.conf \
    && sed -i "s|protected-mode yes|protected-mode no|g" /etc/redis/redis.conf

EXPOSE 6379

ENTRYPOINT redis-server --protected-mode no

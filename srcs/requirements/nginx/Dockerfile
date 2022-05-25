#FROM alpine:3.15.4 AS build-stage
FROM debian:buster AS build-stage

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install openssl nginx -y \
    && rm -rf /etc/nginx/sites-available/default \
    && rm etc/nginx/sites-enabled/default

WORKDIR /my_certs

RUN openssl req  -nodes -new -x509 -days 3650 -keyout inception.key -out inception.crt -subj "/C=MA/ST=KH/L=khouribga/O=1337/OU=Org/CN=www.1337.ma"

COPY ./conf/inception.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/inception.conf /etc/nginx/sites-enabled/inception.conf


FROM debian:buster AS final-stage

LABEL version="1.0"
LABEL description="this is an Nginx Image"
LABEL maintainer="ayoubbrs@gmail.com"
ARG BUILD_DATE
LABEL build-date=${BUILD_DATE}

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install nginx -y \ 
	&& rm -rf /etc/nginx

COPY --from=build-stage /my_certs/* /etc/ssl/
COPY --from=build-stage /etc/nginx /etc/nginx/

EXPOSE 443

ENTRYPOINT ["sleep", "600"]

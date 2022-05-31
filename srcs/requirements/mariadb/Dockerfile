
FROM debian:buster

ARG BUILD_DATE

LABEL version="1.0" \
 description="This Is a mariadb Image" \
 maintainer="ayoubbrs@gmail.com" \
 build-date=${BUILD_DATE}

RUN apt-get update \
   && apt-get upgrade -y \
   && apt-get install mariadb-server mariadb-client mariadb-common -y

COPY ./tools/launch_db.sh ./
RUN chmod 777 ./launch_db.sh

EXPOSE 3306


ENTRYPOINT sh ./launch_db.sh && sleep 800
# ENTRYPOINT ["sleep", "700"]
   
   





FROM debian:buster

RUN apt-get  update \
    && apt-get upgrade -y \
    && apt-get install vsftpd openssl ftp -y 

RUN openssl req  -nodes -new -x509 -days 3650 -keyout /etc/ssl/private/vsftpd.key  -out /etc/ssl/certs/vsftpd.pem  -subj "/C=MA/ST=KH/L=khouribga/O=1337/OU=Org/CN=www.1337.ma"

EXPOSE 21

COPY ./tools/launch_ftp.sh /
RUN chmod +x launch_ftp.sh

# COPY ./tools/vsftpd.conf etc/


ENTRYPOINT sh launch_ftp.sh
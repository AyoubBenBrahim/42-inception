FROM debian:buster

RUN apt-get  update \
    && apt-get upgrade -y \
    && apt-get install vsftpd  -y \
    && openssl -y 
#     &&  jq -y \
#     &&  curl -y \
#     && openssh-server -y 

# RUN echo -e "MA\nKH\nKHOURIBGA\n1337Ltd\nOCP\nOCP SA\ftp_inception@1337.ma\n" | openssl req \
# 			-x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out \
# 			/etc/ssl/private/vsftpd.pem

RUN openssl req  -nodes -new -x509 -days 3650 -keyout /etc/ssl/private/vsftpd.pem  -out /etc/ssl/private/vsftpd.pem  -subj "/C=MA/ST=KH/L=khouribga/O=1337/OU=Org/CN=www.1337.ma"


# RUN cd var/run/
# RUN mkdir -p  var/run/vsftpd/empty
# RUN adduser 'ayoub'
# RUN echo "ayoub:root" | chpasswd
# RUN ssh-keygen -A
# COPY ./tools/vsftpd.conf etc/
EXPOSE 21
# COPY ./tools/launch.sh /

ENTRYPOINT tail -f /dev/null
# ENTRYPOINT sh launch.sh



# RUN apt-get  update \
#     && apt-get upgrade -y \
#     && apt-get install vsftpd  -y \
#     && openssl -y 

# RUN openssl req  -nodes -new -x509 -days 3650 -keyout /etc/ssl/private/vsftpd.pem  -out /etc/ssl/private/vsftpd.pem  -subj "/C=MA/ST=KH/L=khouribga/O=1337/OU=Org/CN=www.1337.ma"
# RUN adduser ayoub
# RUN echo "ayoub:ayoub1337" | /usr/sbin/chpasswd

# cat /etc/vsftpd.conf
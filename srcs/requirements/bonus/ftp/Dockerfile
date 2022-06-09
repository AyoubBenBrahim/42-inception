FROM debian:buster

RUN apt-get  update \
    && apt-get upgrade -y \
    && apt-get install vsftpd  -y \
    && openssl -y 
#     &&  jq -y 

RUN openssl req  -nodes -new -x509 -days 3650 -keyout /etc/ssl/private/vsftpd.pem  -out /etc/ssl/private/vsftpd.pem  -subj "/C=MA/ST=KH/L=khouribga/O=1337/OU=Org/CN=www.1337.ma"
RUN adduser $FTP_USER
RUN echo "FTP_USER:FTP_PWD" | /usr/sbin/chpasswd

# RUN cd var/run/
# RUN mkdir -p  var/run/vsftpd/empty
# RUN adduser 'ayoub'
# RUN echo "ayoub:root" | chpasswd
# RUN ssh-keygen -A

# COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21
# COPY ./tools/launch.sh /

ENTRYPOINT tail -f /dev/null
# ENTRYPOINT sh launch_ftp.sh



# cat /etc/vsftpd.conf
FROM debian:buster

RUN apt-get  update \
    && apt-get upgrade -y \
    && apt-get install vsftpd openssl -y 
#     &&  jq -y 

RUN openssl req  -nodes -new -x509 -days 3650 -keyout /etc/ssl/private/vsftpd.key  -out /etc/ssl/certs/vsftpd.pem  -subj "/C=MA/ST=KH/L=khouribga/O=1337/OU=Org/CN=www.1337.ma"
RUN adduser 'ayoub'
# RUN echo "$FTP_USER:$FTP_PWD" | /usr/sbin/chpasswd
RUN echo "ayoub:ayoub1337" | chpasswd
# RUN echo "$FTP_USER:$FTP_PWD" | /usr/sbin/chpasswd

# RUN sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf \
# sed -i "s/listen_ipv6=YES/listen_ipv6=NO/" /etc/vsftpd.conf \
#     && sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf \
#     && sed -i "s/#chroot_local_user=YES/chroot_local_user=YES/" /etc/vsftpd.conf \
#      && sed -i "s/ssl-cert-snakeoil.pem/vsftpd.pem/" /etc/vsftpd.conf \
#   && sed -i "s/ssl-cert-snakeoil.key/vsftpd.key/" /etc/vsftpd.conf \
#  && sed -i "s/ssl-cert-snakeoil.pem/vsftpd.pem/" /etc/vsftpd.conf \
#  && sed -i "s/ssl_enable=NO/ssl_enable=YES/" /etc/vsftpd.conf \
#     && echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf \
#     && echo "pam_service_name=vsftpd" >> /etc/vsftpd.conf 


# RUN cp -r /etc/vsftpd.conf /etc/vsftpd.conf.old \
#     && echo " \
#     listen=YES \n \
#     listen_ipv6=NO \n \
#     connect_from_port_20=YES \n \
#     anonymous_enable=NO \n \
#     local_enable=YES \n \
#     write_enable=YES \n \
#     chroot_local_user=YES \n \
#     allow_writeable_chroot=YES \n \
#     pam_service_name=vsftpd \n \
#     pasv_enable=YES \n \
#     userlist_enable=YES \n \
#     userlist_file=/etc/vsftpd.userlist \n \
#     userlist_deny=NO" > /etc/vsftpd.conf 




EXPOSE 21
COPY ./tools/launch_ftp.sh /

ENTRYPOINT tail -f /dev/null
# ENTRYPOINT sh launch_ftp.sh

# listen=YES
# listen_ipv6=NO


# rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
# rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
# ssl_enable=NO


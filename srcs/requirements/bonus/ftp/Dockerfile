FROM debian:buster

RUN apt-get  update \
    && apt-get upgrade -y \
    && apt-get install vsftpd openssl -y 

RUN openssl req  -nodes -new -x509 -days 3650 -keyout /etc/ssl/private/vsftpd.key  -out /etc/ssl/certs/vsftpd.pem  -subj "/C=MA/ST=KH/L=khouribga/O=1337/OU=Org/CN=www.1337.ma"
RUN adduser 'ayoub'
# RUN echo "$FTP_USER:$FTP_PWD" | /usr/sbin/chpasswd
RUN echo "ayoub:ayoub1337" | chpasswd

useradd $FTP_USER
echo "$FTP_USER:$FTP_PWD" | chpasswd
mkdir -p /home/ftp
chown nobody:nogroup /home/ftp
chmod a-w /home/ftp
mkdir /home/ftp/files
chown $FTP_USER:$FTP_USER /home/ftp/files
echo "$FTP_USER" >> /etc/vsftpd.userlist
# echo "secure_chroot_dir=/home/ftp/files" | tee -a /tmp/vsftpd.conf
# cp /tmp/vsftpd.conf /etc/vsftpd.conf

EXPOSE 21

COPY ./tools/launch_ftp.sh /

RUN chmod +x launch_ftp.sh

ENTRYPOINT sh launch_ftp.sh
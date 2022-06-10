#!/bin/sh

# useradd $FTP_USER 
# id -u $FTP_USER  &>/dev/null || useradd $FTP_USER  
# echo "$FTP_USER:$FTP_PWD" |  /usr/sbin/chpasswd

# mkdir -p /home/ftp
# chmod 777 /home/ftp
# chown $FTP_USER:$FTP_USER /home/ftp/
# echo "$FTP_USER" >> /etc/vsftpd.userlist


id -u $FTP_USER  &>/dev/null 
if [ $? -eq 1 ]; then
    useradd $FTP_USER  
    echo "$FTP_USER:$FTP_PWD" |  /usr/sbin/chpasswd

    mkdir -p /home/$FTP_USER/ftp
    chmod 777 /home/$FTP_USER/ftp
    chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp
    echo "$FTP_USER" >> /etc/vsftpd.userlist
fi




    # sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf 
    # sed -i "s/listen_ipv6=YES/listen_ipv6=NO/" /etc/vsftpd.conf 
    # sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf 

    # sed -i "s/#chroot_local_user=YES/chroot_local_user=YES/" /etc/vsftpd.conf 
    # echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf 

    # sed -i "s/ssl-cert-snakeoil.key/vsftpd.key/" /etc/vsftpd.conf 
    # sed -i "s/ssl-cert-snakeoil.pem/vsftpd.pem/" /etc/vsftpd.conf 
    # sed -i "s/ssl_enable=NO/ssl_enable=YES/" /etc/vsftpd.conf 

    # echo " pasv_enable=YES" >> /etc/vsftpd.conf 
    # echo " pasv_min_port=40000" >> /etc/vsftpd.conf 
    # echo " pasv_max_port=40010" >> /etc/vsftpd.conf 

    # echo " userlist_enable=YES" >> /etc/vsftpd.conf 
    # echo " userlist_deny=NO" >> /etc/vsftpd.conf 

    # echo " userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf 

    
    #  sed -i "s/secure_chroot_dir=/#secure_chroot_dir=/" /etc/vsftpd.conf 
    #  echo " secure_chroot_dir=/home/ftp/" >> /etc/vsftpd.conf 

service vsftpd restart

/usr/sbin/vsftpd /etc/vsftpd.conf


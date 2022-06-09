#!/bin/sh

    sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf 
    sed -i "s/listen_ipv6=YES/listen_ipv6=NO/" /etc/vsftpd.conf 
    sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf 

    sed -i "s/#chroot_local_user=YES/chroot_local_user=YES/" /etc/vsftpd.conf 
    echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf 

    sed -i "s/ssl-cert-snakeoil.pem/vsftpd.pem/" /etc/vsftpd.conf 
    sed -i "s/ssl-cert-snakeoil.key/vsftpd.key/" /etc/vsftpd.conf 
    sed -i "s/ssl-cert-snakeoil.pem/vsftpd.pem/" /etc/vsftpd.conf 
    sed -i "s/ssl_enable=NO/ssl_enable=YES/" /etc/vsftpd.conf 
    echo " pasv_enable=YES" >> /etc/vsftpd.conf 
  
   

  


    \n \
    userlist_enable=YES \n \
    userlist_file=/etc/vsftpd.userlist \n \
    userlist_deny=NO" > /etc/vsftpd.conf 
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
    echo " pasv_min_port=40000" >> /etc/vsftpd.conf 
    echo " pasv_max_port=40010" >> /etc/vsftpd.conf 

    echo " userlist_enable=YES" >> /etc/vsftpd.conf 
    echo " userlist_deny=NO" >> /etc/vsftpd.conf 

    echo " userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf 

    
     sed -i "s/secure_chroot_dir=/#secure_chroot_dir=/" /etc/vsftpd.conf 
     echo " secure_chroot_dir=/home/ftp/files" >> /etc/vsftpd.conf 

/usr/sbin/vsftpd

# /usr/sbin/vsftpd /etc/vsftpd.conf


#!/bin/sh


# useradd $FTP_USER
# chpasswd <<<"$FTP_USER:$FTP_PASS"
# echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd 
# ==> generates error
# Authentication token manipulation error
# chpasswd: (line 1, user batamn) password not changed


useradd -p $(openssl passwd -1 $FTP_PWD) $FTP_USER
mkdir -p /home/$FTP_USER/ftp
chown nobody:nogroup /home/$FTP_USER/ftp
chmod a-w /home/$FTP_USER/ftp
mkdir /home/$FTP_USER/ftp/files
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist
# echo "secure_chroot_dir=/home/$FTP_USER/ftp/files" | tee -a /etc/vsftpd.conf


#     mkdir -p /home/$FTP_USER/ftp
#     chmod 777 /home/$FTP_USER/ftp
#     chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp
#     echo "$FTP_USER" > /etc/vsftpd.userlist

    sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf 
    sed -i "s/listen_ipv6=YES/listen_ipv6=NO/" /etc/vsftpd.conf 
    sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf 

    sed -i "s/#chroot_local_user=YES/chroot_local_user=YES/" /etc/vsftpd.conf 
    echo "allow_writeable_chroot=YES" | tee -a /etc/vsftpd.conf 

    sed -i "s/ssl-cert-snakeoil.key/vsftpd.key/" /etc/vsftpd.conf 
    sed -i "s/ssl-cert-snakeoil.pem/vsftpd.pem/" /etc/vsftpd.conf 
    sed -i "s/ssl_enable=NO/ssl_enable=YES/" /etc/vsftpd.conf 

    sed -i "s|secure_chroot_dir=/var/run/vsftpd/empty|secure_chroot_dir=/home/$FTP_USER/ftp/files" /etc/vsftpd.conf 
    #  echo " secure_chroot_dir=/home/ftp/" >> /etc/vsftpd.conf

    echo " pasv_enable=YES" | tee -a /etc/vsftpd.conf
    echo " pasv_min_port=40000" | tee -a /etc/vsftpd.conf
    echo " pasv_max_port=40010" | tee -a /etc/vsftpd.conf

    echo " userlist_enable=YES" | tee -a /etc/vsftpd.conf
    echo " userlist_deny=NO" | tee -a /etc/vsftpd.conf

    echo " userlist_file=/etc/vsftpd.userlist" | tee -a /etc/vsftpd.conf


/usr/sbin/vsftpd /etc/vsftpd.conf


#!/bin/sh


# useradd $FTP_USER
# chpasswd <<<"$FTP_USER:$FTP_PASS"
# echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd 


id -u $FTP_USER  &>/dev/null 
if [ $? -eq 1 ]; then
    cp /vsftpd.conf /etc/vsftpd.conf
    useradd -p $(openssl passwd -1 $FTP_PWD) $FTP_USER
    mkdir -p /home/$FTP_USER/ftp
    chown nobody:nogroup /home/$FTP_USER/ftp
    chmod a-w /home/$FTP_USER/ftp
    mkdir /home/$FTP_USER/ftp/files
    chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files
    echo "$FTP_USER" | tee -a /etc/vsftpd.userlist
    echo "secure_chroot_dir=/home/$FTP_USER/ftp/files" | tee -a /etc/vsftpd.conf
fi



/usr/sbin/vsftpd /etc/vsftpd.conf


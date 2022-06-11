#!/bin/sh


# useradd $FTP_USER
# chpasswd <<<"$FTP_USER:$FTP_PASS"
# echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd 


# /bin/egrep  -i "^${FTP_USER}:" /etc/passwd
# if [ $? -eq 0 ]; then
#     echo "-----------\033[0;32ftp: User $FTP_USER exists in /etc/passwd-----\033[0m"
# else
   rm /etc/vsftpd.conf
    cp /vsftpd.conf /etc/vsftpd.conf
    useradd -p $(openssl passwd -1 $FTP_PWD) $FTP_USER
    mkdir -p /home/$FTP_USER/ftp
    chown nobody:nogroup /home/$FTP_USER/ftp
    chmod a-w /home/$FTP_USER/ftp
    mkdir /home/$FTP_USER/ftp/files
    chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files
    echo "$FTP_USER" | tee -a /etc/vsftpd.userlist
    echo "secure_chroot_dir=/home/$FTP_USER/ftp/files" | tee -a /etc/vsftpd.conf
# fi

/usr/sbin/vsftpd /etc/vsftpd.conf


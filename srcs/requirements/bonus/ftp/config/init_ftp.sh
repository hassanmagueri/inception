#! /bin/bash

useradd -m -d $FTP_HOME_DIR -s /bin/bash $FTP_USER;
echo "$FTP_USER:$(cat /run/secrets/ftp_pass)" | chpasswd;

mkdir -p /var/run/vsftpd/empty #?
chmod 755 /var/run/vsftpd/empty



# echo "IP : " $(hostname -I)
mkdir -p $FTP_HOME_DIR/ftp

chmod 777 -R $FTP_HOME_DIR 

echo "test" > $FTP_HOME_DIR/ftp/file


echo "listen=YES
local_enable=YES
write_enable=YES
pasv_enable=YES
pasv_min_port=40000
pasv_max_port=40100
pasv_address=$URL" > /etc/vsftpd.conf

vsftpd /etc/vsftpd.conf
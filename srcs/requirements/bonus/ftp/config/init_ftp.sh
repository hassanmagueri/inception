#!/bin/bash

# ufw allow 20/tcp
# ufw allow 21/tcp
# ufw allow 990/tcp
# ufw allow 40000:50000/tcp


useradd -m -d $FTP_HOME_DIR -s /bin/bash $FTP_USER;
echo "$FTP_USER:$(cat /run/secrets/ftp_pass)" | chpasswd;

mkdir -p /var/run/vsftpd/empty #?


chmod 777 $FTP_HOME_DIR

# echo "IP : " $(hostname -I)
mkdir $FTP_HOME_DIR/ftp

echo "test" > $FTP_HOME_DIR/ftp/file



vsftpd \
    -olisten=YES \
    -owrite_enable=YES \
    -opasv_enable=YES \
    -opasv_min_port=40000 \
    -opasv_max_port=40100 \
    -opasv_address="$URL" \
    -oftpd_banner="Welcome to the FTP Server!"

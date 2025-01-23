#!/bin/bash

# ufw allow 20/tcp
# ufw allow 21/tcp
# ufw allow 990/tcp
# ufw allow 40000:50000/tcp


useradd -m -d $FTP_HOME_DIR -s /bin/bash $FTP_USER;
echo "$FTP_USER:$FTP_PASS" | chpasswd;

mkdir -p /var/run/vsftpd/empty #?
chown root:root /var/run/vsftpd/empty; #?
chmod 755 /var/run/vsftpd/empty; #?

chmod 777 $FTP_HOME_DIR 

# echo "IP : " $(hostname -I)
mkdir $FTP_HOME_DIR/ftp

echo "test" > $FTP_HOME_DIR/ftp/file

# dirmessage_enable=YES
# background=NO
# use_localtime=YES
# xferlog_enable=YES


echo "listen=YES
connect_from_port_20=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES
async_abor_enable=YES
ascii_upload_enable=YES
ascii_download_enable=YES
ls_recurse_enable=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
ssl_enable=NO
pasv_enable=YES
pasv_min_port=40000
pasv_max_port=40100
pasv_address=10.12.100.82" > /etc/vsftpd.conf

# echo "   listen=YES 
#     local_enable=YES 
#     write_enable=YES 
#     pam_service_name=vsftpd
#     rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
#     rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
#     pasv_enable=YES 
#     pasv_min_port=40000 
#     pasv_max_port=40100 
#     anonymous_enable=NO 
#     secure_chroot_dir=/var/run/vsftpd/empty 
#     pasv_address=10.12.100.82 
#     listen_ipv6=NO 
#     ssl_enable=No" > /etc/vsftpd.conf
    
vsftpd /etc/vsftpd.conf

# vsftpd \
#     -olisten=YES \
#     -olocal_enable=YES \
#     -owrite_enable=YES \
#     -opasv_enable=YES \
#     -opasv_min_port=40000 \
#     -opasv_max_port=40100 \
#     -oanonymous_enable=NO \
#     -osecure_chroot_dir=/var/run/vsftpd/empty \
#     -opasv_address="10.12.100.82" \
#     -oftpd_banner="Welcome to the FTP Server!" \
#     -olisten_ipv6=NO \
#     -ossl_enable=NO
    

    # -ochroot_local_user=YES \
    # -oallow_writeable_chroot=YES \
    # -opasv_addr_resolve=NO \
    # -opasv_promiscuous=YES \
    # -oconnect_from_port_20=YES \


# tail -f /dev/null 
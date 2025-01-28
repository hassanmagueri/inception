FROM debian:11

RUN apt update && apt install -y curl vim procps 

RUN apt update && apt install -y vsftpd ufw ftp

COPY ./config/init_ftp.sh /usr/bin/init_ftp.sh

RUN chmod +x /usr/bin/init_ftp.sh


# EXPOSE 20 21 990 40000 50000
EXPOSE 20 21 40000-40100
 

CMD ["init_ftp.sh"]

# CMD ["tail", "-f", "/dev/null"]


# CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
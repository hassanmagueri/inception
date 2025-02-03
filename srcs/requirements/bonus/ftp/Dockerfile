FROM debian:bullseye

RUN apt update && apt install -y vsftpd ufw ftp

COPY ./config/init_ftp.sh /usr/bin/init_ftp.sh

RUN chmod +x /usr/bin/init_ftp.sh

EXPOSE 21 40000-40100
 
CMD ["init_ftp.sh"]
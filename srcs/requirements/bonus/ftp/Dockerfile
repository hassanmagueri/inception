FROM debian:11.11

RUN apt update && apt install -y curl vim procps ufw

RUN apt update && apt install -y vsftpd


EXPOSE 20 21 990 40000 50000



CMD ["tail", "-f", "/dev/null"]

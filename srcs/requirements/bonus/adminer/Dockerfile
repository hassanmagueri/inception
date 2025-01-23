FROM debian:11

RUN apt update && apt install -y adminer

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "/usr/share/adminer/adminer.php"]
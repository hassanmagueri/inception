FROM debian:bullseye

RUN apt update && apt upgrade -y \
	&& apt install -y wget

RUN wget https://github.com/google/cadvisor/releases/download/v0.47.2/cadvisor-v0.47.2-linux-amd64 -O /usr/local/bin/cadvisor

RUN chmod +x /usr/local/bin/cadvisor

CMD [ "/usr/local/bin/cadvisor", "--port=3131" ]
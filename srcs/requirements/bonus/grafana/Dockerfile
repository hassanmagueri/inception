FROM debian:11

RUN apt update -y && apt upgrade -y wget gpg vim apt procps curl

COPY config/init_grafana.sh /usr/bin/
RUN chmod 777 /usr/bin/init_grafana.sh

COPY config/prometheus.yml /

RUN apt-get update -y

RUN apt-get install -y software-properties-common
RUN add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
RUN wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
RUN apt-get update -y
RUN apt-get install grafana -y

RUN apt install prometheus prometheus-node-exporter -y

RUN mkdir -p /var/lib/grafana/dashboards/

COPY config/dashboard.json /var/lib/grafana/dashboards/

EXPOSE 3000 9090 9100

CMD ["init_grafana.sh"]
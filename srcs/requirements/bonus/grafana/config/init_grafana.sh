#!bin/bash
# apt-get install -y apt-transport-https software-properties-common wget
# mkdir -p /etc/apt/keyrings/
# wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | tee /etc/apt/keyrings/grafana.gpg > /dev/null
# echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | tee -a /etc/apt/sources.list.d/grafana.list
# echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com beta main" | tee -a /etc/apt/sources.list.d/grafana.list

# # Installs the latest OSS release:
# apt-get update -y
# apt-get install grafana -y

# apt-get install -y software-properties-common
# add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
# wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
# apt-get update -y
# apt-get install grafana -y



cat << EOF > /etc/grafana/provisioning/dashboards/mydashboards.yaml
apiVersion: 1
providers:
- name: 'default'
  orgId: 1
  folder: ''
  type: file
  disableDeletion: false
  editable: true
  options:
    path: /var/lib/grafana/dashboards
EOF


cat << EOF >  /etc/grafana/provisioning/datasources/prometheus.yaml
apiVersion: 1
datasources:
- name: Prometheus
  type: prometheus
  url: http://localhost:9090
  access: proxy
  isDefault: true
EOF

sleep 1

cat << EOF >  /etc/grafana/grafana.ini
[auth.anonymous]
enabled = true
org_name = Main Org.
org_role = Viewer

[auth]
disable_login_form = true
disable_signout_menu = true

[dashboards]
default_home_dashboard_path = /var/lib/grafana/dashboards/dashboard.json
EOF


service grafana-server start
prometheus --config.file="prometheus.yml" &
prometheus-node-exporter 
# grafana-server --homepath=/usr/share/grafana --config=/etc/grafana/grafana.ini & 
# /usr/share/grafana/bin/grafana server --homepath=/usr/share/grafana --config=/etc/grafana/grafana.ini --packaging=deb \
#     cfg:default.paths.provisioning=/etc/grafana/provisioning cfg:default.paths.data=/var/lib/grafana \
#     cfg:default.paths.logs=/var/log/grafana cfg:default.paths.plugins=/var/lib/grafana/plugins

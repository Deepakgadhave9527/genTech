
#!/bin/bash

set -e

echo "=========================================================="
echo " Starting Idempotent Monitoring Stack Installation"
echo "=========================================================="

# Helper function
is_installed() {
    command -v "$1" >/dev/null 2>&1
}

# =========== 1. System Preparation ===========

echo "[*] Updating system packages..."

sudo dpkg --configure -a
sudo apt-get -f install -y
sudo apt update
sudo apt upgrade -y
sudo apt install -y wget curl tar gnupg apt-transport-https

echo "[*] Creating service users..."

sudo useradd --no-create-home --shell /bin/false prometheus 2>/dev/null || true
sudo useradd --no-create-home --shell /bin/false node_exporter 2>/dev/null || true

sudo mkdir -p /etc/prometheus
sudo mkdir -p /var/lib/prometheus
sudo mkdir -p /etc/alertmanager
sudo mkdir -p /var/lib/alertmanager

# =========== 2. Install Prometheus ===========

if ! is_installed prometheus; then

    echo "[*] Installing Prometheus..."

    cd /tmp

    wget -nc https://github.com/prometheus/prometheus/releases/download/v2.55.1/prometheus-2.55.1.linux-amd64.tar.gz

    tar -xvf prometheus-2.55.1.linux-amd64.tar.gz

    cd prometheus-2.55.1.linux-amd64

    sudo install -m 0755 prometheus /usr/local/bin/prometheus
    sudo install -m 0755 promtool /usr/local/bin/promtool

    sudo cp -r consoles console_libraries /etc/prometheus/

else
    echo "[-] Prometheus already installed. Skipping."
fi

# =========== 3. Install Alertmanager ===========

if ! is_installed alertmanager; then

    echo "[*] Installing Alertmanager..."

    cd /tmp

    wget -nc https://github.com/prometheus/alertmanager/releases/download/v0.27.0/alertmanager-0.27.0.linux-amd64.tar.gz

    tar -xvf alertmanager-0.27.0.linux-amd64.tar.gz

    cd alertmanager-0.27.0.linux-amd64

    sudo install -m 0755 alertmanager /usr/local/bin/alertmanager
    sudo install -m 0755 amtool /usr/local/bin/amtool

else
    echo "[-] Alertmanager already installed. Skipping."
fi

# =========== 4. Install Node Exporter ===========

if ! is_installed node_exporter; then

    echo "[*] Installing Node Exporter..."

    cd /tmp

    wget -nc https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz

    tar -xvf node_exporter-1.8.2.linux-amd64.tar.gz

    cd node_exporter-1.8.2.linux-amd64

    sudo install -m 0755 node_exporter /usr/local/bin/node_exporter

else
    echo "[-] Node Exporter already installed. Skipping."
fi

sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

# =========== 5. Install Grafana ===========

if ! is_installed grafana-server; then

    echo "[*] Installing Grafana..."

    sudo mkdir -p /etc/apt/keyrings

    wget -q -O /tmp/grafana.asc https://apt.grafana.com/gpg-full.key

    sudo cp /tmp/grafana.asc /etc/apt/keyrings/grafana.asc

    echo "deb [signed-by=/etc/apt/keyrings/grafana.asc] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

    sudo apt-get update

    sudo apt-get install -y grafana

else
    echo "[-] Grafana already installed. Skipping."
fi

# =========== 6. Prometheus Alert Rules ===========

echo "[*] Creating Prometheus alert rules..."

sudo tee /etc/prometheus/alert.rules.yml >/dev/null <<'EOF'
groups:
  - name: example-alerts
    rules:

      - alert: InstanceDown
        expr: up == 0
        for: 1m
        labels:
          severity: critical
        annotations:
          summary: "Instance {{ $labels.instance }} is down"
          description: "Prometheus target {{ $labels.instance }} has been unreachable for more than 1 minute."

      - alert: HighCPUUsage
        expr: 100 - (avg by(instance) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100) > 40
        for: 2m
        labels:
          severity: critical
        annotations:
          summary: "High CPU usage detected on {{ $labels.instance }}"
          description: "CPU usage > 40% for more than 2 minutes. VALUE = {{ $value }}%"

      - alert: UnauthorizedRequests
        expr: increase(http_requests_total{status=~"401|403"}[5m]) > 0
        for: 1m
        labels:
          severity: warning
        annotations:
          summary: "Unauthorized requests on {{ $labels.instance }}"
          description: "Detected unauthorized (401/403) requests in the past 5 minutes."

      - alert: HighDiskUsage
        expr: (1 - (node_filesystem_avail_bytes{fstype!~"tmpfs|overlay"} / node_filesystem_size_bytes{fstype!~"tmpfs|overlay"})) * 100 > 80
        for: 2m
        labels:
          severity: warning
        annotations:
          summary: "High Disk Usage on {{ $labels.instance }}"
          description: "Disk usage is above 80% for more than 2 minutes. VALUE = {{ $value }}%"
EOF

# =========== 7. Alertmanager Configuration ===========

echo "[*] Creating Alertmanager configuration..."

sudo tee /etc/alertmanager/alertmanager.yml >/dev/null <<'EOF'
route:
  receiver: pagerduty
  group_by:
    - alertname
    - instance
  group_wait: 10s
  group_interval: 10s
  repeat_interval: 1h

receivers:
  - name: pagerduty
    pagerduty_configs:
      - routing_key: "REPLACE_WITH_NEW_PAGERDUTY_ROUTING_KEY"
        severity: critical
EOF

# =========== 8. Prometheus Configuration ===========

echo "[*] Creating Prometheus configuration..."

sudo tee /etc/prometheus/prometheus.yml >/dev/null <<'EOF'
global:
  scrape_interval: 15s
  evaluation_interval: 15s

# Load alert rules
rule_files:
  - /etc/prometheus/alert.rules.yml

# Alertmanager configuration
alerting:
  alertmanagers:
    - static_configs:
        - targets:
            - "localhost:9093"

# Scrape configurations
scrape_configs:

  # Prometheus monitoring
  - job_name: "prometheus"
    static_configs:
      - targets:
          - "localhost:9090"

  # Node Exporter EC2 discovery
  - job_name: "ec2-node-exporters"
    ec2_sd_configs:
      - region: us-east-1
        port: 9100
        filters:
          - name: "instance-state-name"
            values:
              - "running"

    relabel_configs:
      - source_labels: [__meta_ec2_private_ip]
        regex: (.*)
        target_label: __address__
        replacement: "$1:9100"

      - source_labels: [__meta_ec2_tag_Name]
        target_label: instance_name

  # Alertmanager EC2 discovery for monitoring
  - job_name: "ec2-alertmanagers"
    ec2_sd_configs:
      - region: us-east-1
        port: 9093
        filters:
          - name: "instance-state-name"
            values:
              - "running"

    relabel_configs:
      - source_labels: [__meta_ec2_private_ip]
        regex: (.*)
        target_label: __address__
        replacement: "$1:9093"

      - source_labels: [__meta_ec2_tag_Name]
        target_label: instance_name
EOF

# =========== 9. Set Permissions ===========

echo "[*] Setting permissions..."

sudo chown -R prometheus:prometheus /etc/prometheus
sudo chown -R prometheus:prometheus /var/lib/prometheus

sudo chown -R prometheus:prometheus /etc/alertmanager
sudo chown -R prometheus:prometheus /var/lib/alertmanager

# =========== 10. Prometheus Systemd Service ===========

echo "[*] Creating Prometheus service..."

sudo tee /etc/systemd/system/prometheus.service >/dev/null <<'EOF'
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --storage.tsdb.path=/var/lib/prometheus
Restart=always
RestartSec=5s

[Install]
WantedBy=multi-user.target
EOF

# =========== 11. Alertmanager Systemd Service ===========

echo "[*] Creating Alertmanager service..."

sudo tee /etc/systemd/system/alertmanager.service >/dev/null <<'EOF'
[Unit]
Description=Alertmanager
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/alertmanager \
  --config.file=/etc/alertmanager/alertmanager.yml \
  --storage.path=/var/lib/alertmanager
Restart=always
RestartSec=5s

[Install]
WantedBy=multi-user.target
EOF

# =========== 12. Node Exporter Systemd Service ===========

echo "[*] Creating Node Exporter service..."

sudo tee /etc/systemd/system/node_exporter.service >/dev/null <<'EOF'
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter
Restart=always
RestartSec=5s

[Install]
WantedBy=multi-user.target
EOF

# =========== 13. Validate Configurations ===========

echo "[*] Checking Prometheus rules..."

sudo promtool check rules /etc/prometheus/alert.rules.yml

echo "[*] Checking Prometheus configuration..."

sudo promtool check config /etc/prometheus/prometheus.yml

echo "[*] Checking Alertmanager configuration..."

sudo amtool check-config /etc/alertmanager/alertmanager.yml

# =========== 14. Start Services ===========

echo "[*] Reloading systemd..."

sudo systemctl daemon-reload

echo "[*] Enabling and starting services..."

sudo systemctl enable --now prometheus
sudo systemctl enable --now grafana-server
sudo systemctl enable --now alertmanager
sudo systemctl enable --now node_exporter

sudo systemctl restart prometheus
sudo systemctl restart alertmanager
sudo systemctl restart node_exporter

# =========== 15. Final Status ===========

echo "=========================================================="
echo " Monitoring Stack Installation Completed"
echo "=========================================================="

sudo systemctl is-active prometheus
sudo systemctl is-active alertmanager
sudo systemctl is-active grafana-server
sudo systemctl is-active node_exporter

echo "=========================================================="
echo " Prometheus    : http://localhost:9090"
echo " Grafana       : http://localhost:3000"
echo " Alertmanager  : http://localhost:9093"
echo " Node Exporter : http://localhost:9100/metrics"
echo " Rules         : http://localhost:9090/rules"
echo "=========================================================="

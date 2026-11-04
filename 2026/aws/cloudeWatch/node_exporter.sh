
#!/bin/bash

echo "[*] Creating node_exporter user..."
sudo useradd --no-create-home --shell /bin/false node_exporter || true

echo "[*] Downloading Node Exporter..."
cd /tmp
curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz

tar -xvf node_exporter-1.8.2.linux-amd64.tar.gz
cd node_exporter-1.8.2.linux-amd64

echo "[*] Installing Node Exporter binary..."
sudo cp node_exporter /usr/local/bin/
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

echo "[*] Creating systemd service for Node Exporter..."
sudo tee /etc/systemd/system/node_exporter.service >/dev/null <<'EOF'
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
ExecStart=/usr/local/bin/node_exporter
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable --now node_exporter

echo "[*] Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo ">>> Node Exporter installed and running on port 9100"
echo "=========================================="
echo " Installation Completed "
echo "=========================================="



//====================

1. Create the file
vi node.sh


2. Run the following command to execute the script:
bash node.sh

//====================

sudo systemctl status node_exporter


//====================

restart the service:

sudo systemctl daemon-reload
sudo systemctl restart node_exporter
sudo systemctl enable node_exporter
#!/bin/bash

set -e

echo "=== 🚀 Installing Docker if not present ==="
if ! command -v docker &> /dev/null
then
    echo "Docker not found. Installing..."
    apt-get update
    apt-get install -y docker.io
    systemctl enable docker
    systemctl start docker
else
    echo "Docker already installed."
fi

echo "=== 🧱 Building Docker image for Nexus Node ==="
git clone https://github.com/oneraid/nexus-node-setup.git /tmp/nexus-node-setup
cd /tmp/nexus-node-setup

docker build -t nexus-node .

echo "=== 🚀 Starting Nexus Node Container ==="
docker run -d \
  --name nexus-node \
  --restart unless-stopped \
  -v nexus_data:/root/.nexus \
  nexus-node

echo "=== ✅ Nexus Node is running! ==="
docker ps | grep nexus-node

#!/bin/bash

# Warna untuk output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=====================================${NC}"
echo -e "${GREEN}  Nexus Network Node Setup${NC}"
echo -e "${GREEN}=====================================${NC}"
echo ""

# Cek apakah NODE_ID sudah di-set dari environment variable
if [ -z "$NODE_ID" ]; then
    echo -e "${YELLOW}Masukkan Node ID Anda:${NC}"
    read -r NODE_ID
    
    if [ -z "$NODE_ID" ]; then
        echo "Error: Node ID tidak boleh kosong!"
        exit 1
    fi
fi

echo ""
echo -e "${GREEN}Starting Nexus Node dengan ID: ${NODE_ID}${NC}"
echo ""

# Jalankan nexus network
exec nexus-network start --node-id "$NODE_ID"
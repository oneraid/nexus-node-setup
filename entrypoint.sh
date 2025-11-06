#!/bin/bash

# Warna untuk output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
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
        echo -e "${RED}Error: Node ID tidak boleh kosong!${NC}"
        exit 1
    fi
fi

echo ""
echo -e "${GREEN}Starting Nexus Node dengan ID: ${NODE_ID}${NC}"
echo ""

# Cari lokasi binary nexus
NEXUS_BIN=""

# Cek beberapa lokasi yang mungkin
if [ -f "/root/.nexus/nexus" ]; then
    NEXUS_BIN="/root/.nexus/nexus"
elif [ -f "/usr/local/bin/nexus" ]; then
    NEXUS_BIN="/usr/local/bin/nexus"
elif command -v nexus &> /dev/null; then
    NEXUS_BIN=$(command -v nexus)
fi

# Jika tidak ditemukan, coba cari
if [ -z "$NEXUS_BIN" ]; then
    echo -e "${YELLOW}Mencari binary nexus...${NC}"
    NEXUS_BIN=$(find /root -name "nexus" -type f 2>/dev/null | head -1)
fi

if [ -z "$NEXUS_BIN" ]; then
    echo -e "${RED}Error: Nexus binary tidak ditemukan!${NC}"
    echo "Mencoba list file di /root/.nexus:"
    ls -la /root/.nexus/ 2>/dev/null || echo "Folder tidak ditemukan"
    exit 1
fi

echo -e "${GREEN}Nexus binary ditemukan di: ${NEXUS_BIN}${NC}"
echo ""

# Jalankan nexus network
exec "$NEXUS_BIN" start --node-id "$NODE_ID"
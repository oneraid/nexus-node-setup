# Nexus Network Node - Docker Setup

Jalankan Nexus Network Node dengan mudah menggunakan Docker.

## Prerequisites

- Docker installed di sistem Anda
- Node ID dari Nexus Network

## Quick Start

### 1. Clone Repository

```bash
git clone https://github.com/username/nexus-node-docker.git
cd nexus-node-docker
```

### 2. Build Docker Image

```bash
docker build -t nexus-node .
```

### 3. Run Node

```bash
docker run -it --name nexus-node nexus-node
```

Anda akan diminta untuk memasukkan Node ID saat container berjalan.

## Atau Menggunakan Docker Compose

### 1. Set Environment Variable

Buat file `.env`:

```bash
echo "NODE_ID=your-node-id-here" > .env
```

### 2. Run dengan Docker Compose

```bash
docker-compose up -d
```

## Melihat Logs

```bash
docker logs -f nexus-node
```

## Stop Node

```bash
docker stop nexus-node
```

## Remove Container

```bash
docker rm nexus-node
```

## Alternative: Run Langsung dengan Docker Run

```bash
docker run -it -e NODE_ID=your-node-id-here --name nexus-node nexus-node
```

## Troubleshooting

Jika ada masalah, cek logs dengan:

```bash
docker logs nexus-node
```

## Update Node

```bash
docker stop nexus-node
docker rm nexus-node
docker build -t nexus-node .
docker run -it --name nexus-node nexus-node
```

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    bash \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://cli.nexus.xyz/ | sh
ENV PATH="/root/.nexus/bin:${PATH}"

CMD ["nexus-network", "start", "--node-id", "37274387"]

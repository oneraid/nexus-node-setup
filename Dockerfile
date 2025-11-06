FROM ubuntu:22.04

# Update dan install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    ca-certificates \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /root

# Download dan install Nexus CLI
RUN curl -fsSL https://cli.nexus.xyz/ -o install.sh && \
    bash install.sh && \
    rm install.sh

# Add nexus to PATH
ENV PATH="/root/.nexus:${PATH}"

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
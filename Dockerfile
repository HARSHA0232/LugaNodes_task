# Use a base image with a suitable environment
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    git \
    libssl-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libgmp-dev \
    zlib1g-dev \
    pkg-config \
    libsystemd-dev \
    automake \
    autoconf \
    libtool \
    libffi-dev \
    libcurl4-openssl-dev \
    cabal-install \
    && rm -rf /var/lib/apt/lists/*

# Install libsodium
COPY scripts/install_libsodium.sh /scripts/install_libsodium.sh
RUN chmod +x /scripts/install_libsodium.sh && /scripts/install_libsodium.sh

# Clone and build cardano-node
COPY scripts/build_cardano_node.sh /scripts/build_cardano_node.sh
RUN chmod +x /scripts/build_cardano_node.sh && /scripts/build_cardano_node.sh

# Clone and build cardano-cli
COPY scripts/build_cardano_cli.sh /scripts/build_cardano_cli.sh
RUN chmod +x /scripts/build_cardano_cli.sh && /scripts/build_cardano_cli.sh

# Define entrypoint
ENTRYPOINT ["/bin/bash"]

#!/bin/bash

# Variables
LIBSODIUM_VERSION="1.0.18"
LIBSODIUM_URL="https://download.libsodium.org/libsodium/releases/libsodium-${LIBSODIUM_VERSION}.tar.gz"

# Install libsodium
echo "Installing libsodium version ${LIBSODIUM_VERSION}..."
wget ${LIBSODIUM_URL} -O libsodium-${LIBSODIUM_VERSION}.tar.gz

# Extract the downloaded file
tar xf libsodium-${LIBSODIUM_VERSION}.tar.gz

# Navigate to the extracted directory
cd libsodium-${LIBSODIUM_VERSION}

# Configure, build, and install libsodium
./configure
make
make check
make install

# Update shared library cache
ldconfig

# Clean up
cd ..
rm -rf libsodium-${LIBSODIUM_VERSION} libsodium-${LIBSODIUM_VERSION}.tar.gz

echo "libsodium version ${LIBSODIUM_VERSION} installed successfully."

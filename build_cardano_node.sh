#!/bin/bash

# Clone the cardano-node repository
echo "Cloning cardano-node repository..."
git clone https://github.com/input-output-hk/cardano-node.git /cardano-node
cd /cardano-node
git fetch --tags
git checkout tags/9.1.1

# Build cardano-node
echo "Building cardano-node..."
cabal update
cabal build cardano-node
echo "cardano-node built successfully."

# Copy binaries to /binaries folder
cp $(find ./dist-newstyle -name cardano-node) /binaries/cardano-node

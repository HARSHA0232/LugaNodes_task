#!/bin/bash

# Clone the cardano-cli repository
echo "Cloning cardano-cli repository..."
git clone https://github.com/input-output-hk/cardano-cli.git /cardano-cli
cd /cardano-cli
git fetch --tags
git checkout tags/9.2.1.0

# Build cardano-cli
echo "Building cardano-cli..."
cabal update
cabal build cardano-cli
echo "cardano-cli built successfully."

# Copy binaries to /binaries folder
cp $(find ./dist-newstyle -name cardano-cli) /binaries/cardano-cli

# Cardano Toolchain Build with Docker

This repository contains a Dockerized environment for building `cardano-node` and `cardano-cli` binaries, along with all necessary dependencies like `libsodium`.

## Prerequisites

- Ensure **Docker** is installed and running on your system. You can download Docker from the official website: [Docker Installation](https://www.docker.com/products/docker-desktop).

### System Requirements
- Linux, macOS, or Windows (with WSL2)
- At least 4GB of free RAM
- Adequate disk space for building binaries (recommended 10GB)

## Setup and Deployment Process

### Step-by-Step Guide

1. **Clone the Repository**:
   - First, you need to clone this repository to your local system.
   ```
   git clone https://github.com/your-username/cardano-toolchain.git
   cd cardano-toolchain
   ```

2. **Build the Docker Image**:

Build the Docker image using the Dockerfile provided in the repository.
This will set up the required environment, install dependencies (such as libsodium), and prepare the system to compile cardano-node and cardano-cli.

Run the following command in the root directory (where the Dockerfile is located):

```
docker build -t cardano-toolchain .
docker build command creates a new Docker image from the Dockerfile.
-t cardano-toolchain tags the image with the name cardano-toolchain for easy reference.
```

3. **Run the Docker Container**:
Once the image is built, you can run the container and use it to build the Cardano binaries.

```
docker run -it cardano-toolchain
```
Explanation:
docker run creates and starts a new container from the cardano-toolchain image.
-it flag ensures the container is interactive (you can execute commands inside the container).
Building cardano-node and cardano-cli Binaries:

The container will automatically begin the build process for both cardano-node and cardano-cli based on the scripts provided in the scripts/ folder.
These scripts (build_cardano_node.sh and build_cardano_cli.sh) handle the cloning of the Cardano repositories, checking out specific versions, and building the binaries.
Check the Binaries:

After the build is complete, the binaries will be available in the /binaries/ directory inside the container.
To verify the binaries have been built successfully, you can list the contents of the /binaries directory.
Run the following command inside the container:

````
ls /binaries
```
You should see:
```
cardano-node
cardano-cli
```
4. **Extract the Binaries (Optional)**:

If you want to copy the built binaries from the container to your host machine, you can use the docker cp command.

```
docker cp <container-id>:/binaries ./binaries
```
Replace <container-id> with the ID of your running container (which can be found using docker ps).
Cleanup:
Once you are done, you can stop and remove the container.

```
docker stop <container-id>
docker rm <container-id>
```

Understanding the Dockerfile
The `Dockerfile` contains the instructions for setting up the build environment. Here's a brief overview:

 - Base Image: ubuntu:22.04 is used as the base image to ensure compatibility with all required dependencies.
 - Installing Dependencies: Essential build tools, libraries (libsodium), and cabal (the Haskell build tool used for compiling Cardano) are installed.
 - Build Scripts: The Dockerfile uses shell scripts located in the scripts/ directory to automate the installation and build processes.
 - Binaries: The final output (the built binaries) is placed in the /binaries/ directory.

## Scripts Breakdown
 - install_libsodium.sh: Installs libsodium (version 1.0.18), which is a required dependency for building Cardano binaries.
 - build_cardano_node.sh: Clones the cardano-node repository, checks out version 9.1.1, and compiles it.
 - build_cardano_cli.sh: Clones the cardano-cli repository, checks out version 9.2.1.0, and compiles it.

MADE BY BAJJURI HARSHA VARDHAN 21BDS0232

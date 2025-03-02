# anthropic-quickstarts-network-access
Modified version of `ghcr.io/anthropics/anthropic-quickstarts:computer-use-demo-latest` to enable network-wide access. Dynamically replaces `127.0.0.1` and `localhost` with the host machine's IP address, allowing users to connect to the application from any IP address within the same network or Public Ip address.


# Anthropic Quickstarts Network Access

This repository provides a modified version of the `ghcr.io/anthropics/anthropic-quickstarts:computer-use-demo-latest` Docker image, allowing users to connect to the application from any IP address within the network.

## Overview

The goal of this project is to enable users to access the application running in the Docker container from any IP address within the same network. This is achieved by dynamically replacing references to `127.0.0.1` and `localhost` with the host machine's IP address.

## Getting Started

### Prerequisites

- Docker installed on your machine
- A valid `ANTHROPIC_API_KEY`

### Installation

1. Clone the repository:

```sh
git clone https://github.com/yourusername/anthropic-quickstarts-network-access.git
cd anthropic-quickstarts-network-access
```
2. Build the Docker image

```
docker build -t anthropic-quickstarts-modified .
```
3. Run the Docker container

```
export ANTHROPIC_API_KEY=sk-ant-api-key

docker run \
    -e ANTHROPIC_API_KEY=$env:ANTHROPIC_API_KEY \
    -v $HOME/.anthropic:/home/computeruse/.anthropic \
    -p 5900:5900 \
    -p 8501:8501 \
    -p 6080:6080 \
    -p 8080:8080 \
    -it anthropic-quickstarts-modified
```

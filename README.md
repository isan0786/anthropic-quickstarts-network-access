# anthropic-quickstarts-network-access
Modified version of `ghcr.io/anthropics/anthropic-quickstarts:computer-use-demo-latest` to enable network-wide access. Dynamically replaces `127.0.0.1` and `localhost` with the host machine's IP address, allowing users to connect to the application from any IP address within the same network or Public Ip address.

---------------------------------------------------------------------------------STEPS FOR WINDOWS----------------------------------------------------------------------------------------------------------------------------------------------------
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
3. Run the Docker container. Make sure to replace YOUR_API_KEY with your actual API key and HOST_IP with the IP address of the host machine (NOT with the container IP address).

```
$env:ANTHROPIC_API_KEY = "API_KEY"
docker run `
     -e ANTHROPIC_API_KEY=$env:ANTHROPIC_API_KEY `
     -v $HOME/.anthropic:/home/computeruse/.anthropic `
     -p 5900:5900 `
     -p 8501:8501 `
     -p 6080:6080 `
     -p 8080:8080 `
     -it anthropic-quickstarts-modified HOST_IP
```
Example:

```
$env:ANTHROPIC_API_KEY = "sk-ant-api"

docker run `
     -e ANTHROPIC_API_KEY=$env:ANTHROPIC_API_KEY `
     -v $HOME/.anthropic:/home/computeruse/.anthropic `
     -p 5900:5900 `
     -p 8501:8501 `
     -p 6080:6080 `
     -p 8080:8080 `
     -it anthropic-quickstarts-modified 192.168.2.59

```


---------------------------------------------------------------------------------STEPS FOR LINUX----------------------------------------------------------------------------------------------------------------------------------------------------
1. Download the docker image directly and set the API Key:
```
 export ANTHROPIC_API_KEY=sk-ant-api

docker run \
    -e ANTHROPIC_API_KEY=$ANTHROPIC_API_KEY \
    -v $HOME/.anthropic:/home/computeruse/.anthropic \
    -p 5900:5900 \
    -p 8501:8501 \
    -p 6080:6080 \
    -p 8080:8080 \
    -it ghcr.io/anthropics/anthropic-quickstarts:computer-use-demo-latest
 
```
2. SSH into your container
```
docker exec -it CONTAINER_ID /bin/sh
```
3. Now, replace the localhost and 127.0.0.1 manually. Just Replace {IP_address} with real ip address, for eg: 192.168.2.59
```
find /home/computeruse -type f -not -path "/home/computeruse/.pyenv/*" -not -path "/home/computeruse/.vscode-server/*" -exec sed -i "s/127.0.0.1/{IP_address}/g" {} +
find /home/computeruse -type f -not -path "/home/computeruse/.pyenv/*" -not -path "/home/computeruse/.vscode-server/*" -exec sed -i "s/localhost/{IP_address}/g" {} +
```
eg:
```
find /home/computeruse -type f -not -path "/home/computeruse/.pyenv/*" -not -path "/home/computeruse/.vscode-server/*" -exec sed -i "s/127.0.0.1/192.168.2.59/g" {} +
find /home/computeruse -type f -not -path "/home/computeruse/.pyenv/*" -not -path "/home/computeruse/.vscode-server/*" -exec sed -i "s/localhost/192.168.2.59/g" {} +
```
WARNING: EVERY TIME THE NEW CONTAINER GET'S DELETED, REPLACED or CREATED, THE ABOVE LINUX STEPS MUST BE FOLLOWED.

THE PERMANENT SOLUTION WOULD BE AVAILABLE SOON FOR LINUX.

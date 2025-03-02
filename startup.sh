#!/bin/sh

# Get the IP address of the host machine
HOST_IP=$(ip route get 1 | awk '{print $7;exit}')

# Replace 127.0.0.1 and localhost with the host IP address
find /home/computeruse -type f -not -path "/home/computeruse/.pyenv/*" -not -path "/home/computeruse/.vscode-server/*" -exec sed -i "s/127.0.0.1/${HOST_IP}/g" {} +
find /home/computeruse -type f -not -path "/home/computeruse/.pyenv/*" -not -path "/home/computeruse/.vscode-server/*" -exec sed -i "s/localhost/${HOST_IP}/g" {} +

# Start the original entrypoint script or command
exec "$@"
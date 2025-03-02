FROM ghcr.io/anthropics/anthropic-quickstarts:computer-use-demo-latest

# Copy the startup script into the container
COPY startup.sh /usr/local/bin/startup.sh

# Make the startup script executable
RUN chmod +x /usr/local/bin/startup.sh

# Set the startup script as the entrypoint
ENTRYPOINT ["/usr/local/bin/startup.sh"]
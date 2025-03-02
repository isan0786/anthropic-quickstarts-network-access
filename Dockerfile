FROM ghcr.io/anthropics/anthropic-quickstarts:computer-use-demo-latest

# Switch to root user to perform operations
USER root

# Copy the startup script to a location with appropriate permissions
COPY startup.sh /usr/local/bin/startup.sh

# Make the startup script executable
RUN chmod +x /usr/local/bin/startup.sh

# Switch back to the original user (if needed)
USER computeruse

# Set the startup script as the entrypoint
ENTRYPOINT ["/usr/local/bin/startup.sh"]
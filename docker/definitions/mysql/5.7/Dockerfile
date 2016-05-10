# Base image
FROM mysql:5.7

# Copy starting scripts file
COPY start.sh /root/start.sh

# Set timezone
RUN echo 'Europe/Warsaw' > /etc/timezone

# Run necessary services
CMD ["/bin/bash", "/root/start.sh"]

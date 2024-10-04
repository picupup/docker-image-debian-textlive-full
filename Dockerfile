# Use the official Debian 11 (bullseye) image
FROM debian:11

# Set environment variable to non-interactive for apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get update && \
    apt-get install -y texlive-full pandoc pdftk grep curl vim git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the default command to run when container starts
CMD [ "bash" ]



# Use the official Debian 11 (bullseye) image
FROM debian:11

# Set environment variable to non-interactive for apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get update
RUN apt-get install -y curl
RUN curl -L https://raw.githubusercontent.com/picupup/scripts/refs/heads/main/one-time-bin/install-texlive.sh | bash -s '/usr/local/texlive' || exit 1
RUN apt-get install -y pandoc
RUN apt-get install -y pdftk
RUN apt-get install -y grep
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y python3
RUN apt-get install -y python3-venv

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the default command to run when container starts
CMD [ "bash" ]



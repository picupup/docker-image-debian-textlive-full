# Use the official Debian 11 (bullseye) image
FROM debian:11

# Set environment variable to non-interactive for apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get update
RUN apt-get install -y curl perl-doc pandoc pdftk grep vim git python3 python3-venv
RUN rm -rf /usr/share/dotnet /opt/ghc "/usr/local/share/boost" "$AGENT_TOOLSDIRECTORY" /var/lib/apt/lists/* && apt-get clean
RUN curl -L https://raw.githubusercontent.com/picupup/scripts/refs/heads/main/one-time-bin/install-texlive.sh | bash -s -- -p '/usr/local/texlive' -f || exit 1 && \
    rm -rf /usr/share/dotnet /opt/ghc "/usr/local/share/boost" "$AGENT_TOOLSDIRECTORY" /var/lib/apt/lists/* && apt-get clean

# Set the default command to run when container starts
CMD [ "bash" ]
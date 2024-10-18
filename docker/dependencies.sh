#!/bin/bash

# Update package lists
apt-get update && apt-get -qq install gnupg

# Add Debian sources to apt and import necessary GPG keys
sh -c 'echo "deb http://http.us.debian.org/debian stable main contrib non-free" >> /etc/apt/sources.list'
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 605C66F00D6C9793

# Update package lists and set debconf selections for mscorefonts installer
apt-get update
echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections

# Install necessary packages without recommended dependencies
apt-get -qq install --no-install-recommends \
    ttf-mscorefonts-installer \
    fonts-liberation \
    fonts-freefont-ttf \
    libssl-dev

apt-get -qq install --no-install-recommends \
    imagemagick \
    libmagick++-dev \
    ghostscript \
    libglpk40

apt-get -qq install --no-install-recommends \
    libgs-dev \
    librsvg2-dev \
    libwebp-dev \
    jq

# Clean up apt cache
rm -rf /var/lib/apt/lists/* && rm -rf /src/*.deb

# Upgrade packages
apt-get upgrade -y

# Install mc (MinIO Client)
wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /usr/local/bin/mc && \
    chmod +x /usr/local/bin/mc

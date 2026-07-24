#!/bin/bash

# Update package lists
apt-get update && apt-get -qq install gnupg

# Install necessary packages without recommended dependencies
apt-get -qq install --no-install-recommends \
    libssl-dev

apt-get -qq install --no-install-recommends \
    imagemagick \
    libmagick++-dev \
    ghostscript \
    libglpk40 \
    libgdal-dev libgeos-dev \
    libudunits2-dev

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

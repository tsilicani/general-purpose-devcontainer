FROM python:3.12-bookworm

# Avoid prompts from apt and set locale environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

# Update the system, install all necessary libraries, and configure locales in one step to minimize layer size
RUN apt-get update && apt-get install -y \
    # Install git for source control management
    git \
    # Install wget for downloading files from the internet
    wget \
    # Install curl for transferring data using various protocols
    curl \
    # Install htop
    htop \
    # Install locales for setting up the system locale
    locales \
    # Install ca-certificates for SSL/TLS certificate verification
    ca-certificates \
    # Install gnupg2 for package authentication
    gnupg2 \
    # Install cmake for configuring C/C++ projects
    cmake \
    # Install build-essential for basic package building
    build-essential \
    # Install libsqlite3-mod-spatialite for Valhalla's spatial processes
    libsqlite3-mod-spatialite \
    # Install libsqlite3-dev for SQLite development files
    libsqlite3-dev \
    # Install libspatialite-dev for SpatiaLite development files
    libspatialite-dev \
    # Install autoconf for configuring source packages
    autoconf \
    # Install libtool for configuring source packages
    libtool \
    # Install pkg-config to manage compile and link flags for libraries
    pkg-config \
    # Install libczmq-dev for ZeroMQ library used in prime_server
    libczmq-dev \
    # Install libzmq5 for ZeroMQ library
    libzmq5 \
    # Install libcurl4-openssl-dev for curl/ssl capabilities
    libcurl4-openssl-dev \
    # Install zlib1g-dev as a compression library
    zlib1g-dev \
    # Install jq for CLI tool for JSON processing
    jq \
    # Install libgeos-dev for geometry engine vector operations
    libgeos-dev \
    # Install liblz4-dev for fast compression algorithm
    liblz4-dev \
    # Install libgeos++-dev for C++ bindings for GEOS
    libgeos++-dev \
    # Install libprotobuf-dev for protocol buffer support
    libprotobuf-dev \
    # Install protobuf-compiler as a compiler for protocol buffers
    protobuf-compiler \
    # Install libboost-all-dev as a universal C++ library
    libboost-all-dev \
    # Install libluajit-5.1-dev for LuaJIT development files
    libluajit-5.1-dev \
    # Install spatialite-bin for SpatiaLite CLI tools
    spatialite-bin \
    # Install unzip for unzipping files
    unzip \
    # Python pip
    python3-pip \
    # Python venv
    python3-venv \
    # Osmium tool
    osmium-tool && \
    # Generate and update locale
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

# Install oh-my-bash
RUN curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh | bash && \
    sed -i 's/OSH_THEME="font"/OSH_THEME="powerline"/g' ~/.bashrc
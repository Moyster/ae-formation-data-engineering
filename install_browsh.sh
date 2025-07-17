#!/bin/bash

# Browsh Installation Script for Ubuntu/Debian
set -e

echo "🌐 Installing Browsh on Ubuntu"
echo "=============================="

# Update package list
echo "📦 Updating package list..."
sudo apt update

# Install Firefox if not already installed
echo "📦 Installing Firefox (required for Browsh)..."
sudo apt install -y firefox

# Install required dependencies
echo "📦 Installing dependencies..."
sudo apt install -y wget curl

# Get the latest Browsh release
echo "🔍 Getting latest Browsh version..."
LATEST_RELEASE=$(curl -s https://api.github.com/repos/browsh-org/browsh/releases/latest | grep "tag_name" | cut -d '"' -f 4)
echo "Latest version: $LATEST_RELEASE"

# Download and install Browsh .deb package
echo "⬇️  Downloading Browsh..."
DOWNLOAD_URL="https://github.com/browsh-org/browsh/releases/download/$LATEST_RELEASE/browsh_${LATEST_RELEASE#v}_linux_amd64.deb"
wget -O /tmp/browsh.deb "$DOWNLOAD_URL"

echo "📦 Installing Browsh..."
sudo dpkg -i /tmp/browsh.deb

# Fix any dependency issues
sudo apt-get install -f

# Cleanup
echo "🧹 Cleaning up..."
rm -f /tmp/browsh.deb

echo "✅ Browsh installation complete!"
echo ""
echo "🚀 To start Browsh, run: browsh"
echo "📖 For help, run: browsh --help"
echo "⌨️  Use Ctrl+Q to quit Browsh"

#!/bin/bash

# Automated SSH and UFW Firewall Setup Script for Ubuntu Server
# This script installs SSH server, enables it, sets up basic UFW firewall rules,
# and tests internet connectivity. Run with sudo privileges.

# Check if running as root or with sudo
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root or with sudo."
   exit 1
fi

echo "Starting SSH and Firewall setup..."

# Step 1: Install and enable SSH
echo "Installing OpenSSH server..."
apt update -y  # Quick update for latest packages
apt install openssh-server -y
systemctl enable ssh
systemctl start ssh
systemctl status ssh --no-pager -l | head -5  # Show brief status

# Step 2: Install and configure UFW Firewall
echo "Installing and configuring UFW Firewall..."
apt install ufw -y

# Set default policies: Deny incoming, allow outgoing
ufw default deny incoming
ufw default allow outgoing

# Allow essential ports
ufw allow ssh  # Port 22 for SSH
ufw allow 80/tcp  # HTTP (for future web server)
ufw allow 443/tcp  # HTTPS (for future web server)

# Enable UFW
ufw enable
ufw status verbose  # Display current rules

# Step 3: Test internet connectivity
echo "Testing internet connectivity..."
if ping -c 1 google.com &>/dev/null; then
    echo "Internet connection: OK"
else
    echo "Internet connection: Issue detected (check network)"
fi

# Step 4: Final summary
echo "Setup completed successfully!"
echo "SSH is running on port 22."
echo "Firewall rules: SSH (22), HTTP (80), HTTPS (443) allowed."
echo "To connect remotely: ssh arri@YOUR_SERVER_IP"
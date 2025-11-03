# Bash Script: Automated SSH and UFW Firewall Setup

This Bash script automates the installation and configuration of OpenSSH server and UFW firewall on Ubuntu Server. It's designed for quick server hardening in DevOps environments.

## Features
- Installs and enables SSH server.
- Configures UFW with default deny incoming/allow outgoing policies.
- Opens essential ports: SSH (22), HTTP (80), HTTPS (443).
- Tests internet connectivity via ping.
- Includes error checking and status output.

## Prerequisites
- Ubuntu Server (tested on 24.04 LTS).
- Run as root or with `sudo`.

## Installation & Usage
1. Download the script

## Troubleshooting
- If SSH fails: Check `sudo systemctl status ssh`.
- Firewall issues: `sudo ufw status` and `sudo ufw reset` to restart.
- No internet: Verify network with `ip addr show`.

## Author
Arash Estakhrian - Learning Linux SysAdmin & DevOps.

## License
MIT License

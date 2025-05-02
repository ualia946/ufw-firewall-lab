#!/bin/bash

# ------------------------------------------------------------
# UFW Firewall Configuration Script
# Author: Ivelin
# Description: Applies basic security policies and access control
#              for an Ubuntu-based server using UFW.
# ------------------------------------------------------------

echo "Applying UFW firewall rules..."

# 1. Reset any existing rules
sudo ufw --force reset

# 2. Set default policy
sudo ufw default deny incoming
sudo ufw default allow outgoing

# 3. Allow SSH only from your personal device (replace with your IP)
sudo ufw allow from 192.168.1.141 to any port 22 proto tcp comment "Allow SSH from my Mac"

# 4. Allow HTTP (port 80) only from your personal device
sudo ufw allow from 192.168.1.141 to any port 80 proto tcp comment "Allow HTTP from my Mac"

# 5. Block outgoing access to gambling site (replace with resolved IP)
sudo ufw deny out to 185.27.134.10 comment "Block bet365.com"

# 6. Enable logging (optional but useful for debugging)
sudo ufw logging on

# 7. Enable UFW
sudo ufw --force enable

# Show final status
echo
echo "Final UFW rule set:"
sudo ufw status verbose

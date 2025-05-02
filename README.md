# 🔥 UFW Firewall Simulation Lab

This project demonstrates how to configure and test a firewall using UFW (Uncomplicated Firewall) on a Linux virtual machine. The goal is to simulate real-world traffic filtering scenarios and show how UFW can enforce network security through stateful rules.

## 🧠 Objectives

- Understand the difference between firewalls and ACLs (Access Control Lists)
- Implement security policies to control inbound and outbound traffic
- Use UFW to allow or deny connections based on IP, port, and protocol
- Demonstrate how stateful firewalls can remember connection context
- Block access to unwanted websites via IP-based rules

## 🛠️ Tools and Technologies

- UFW (iptables frontend)
- Ubuntu 22.04 (Virtual Machine)
- Apache2 (to simulate a web server)
- SSH (remote terminal access)
- dig, curl, ping (for DNS/IP and connection tests)
- Optional: PuTTY (SSH client on Windows)

## 🖥️ Lab Setup

The environment simulates a home network where:

- An Ubuntu VM (`192.168.1.179` private IPv4) is used as a secure internal server, where UFW (Uncomplicated Firewall) is configured and tested.
- Two host machines (Mac and Windows) act as external clients.
- Bridge mode is enabled on one of the hosts so that all devices are connected to the same local network.

## 🔐 Firewall Rules Implemented

```bash
# Default policy
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH only from my Windows personal device
sudo ufw allow from 192.168.1.141 to any port 22 proto tcp comment 'Allow SSH from my Mac'

# Allow HTTP only from my MAC personal device
sudo ufw allow from 192.168.1.141 to any port 80 proto tcp comment 'Allow HTTP from my Mac'

# Block outgoing access to gambling websites
sudo ufw deny out to 185.27.134.10 comment 'Block bet365 access'

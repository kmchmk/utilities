#!/bin/bash

# Check the Swap Space before creating the Swap File
free -h

# Create the Swap File using fallocate
fallocate -l 8G ~/.swapfile

# Set the Proper Permissions
sudo chmod 600 ~/.swapfile

# Make the File a Swap File
sudo mkswap ~/.swapfile

# Activate the Swap File
sudo swapon ~/.swapfile

# Make the Swap File Permanent
echo "/home/$(whoami)/.swapfile none swap sw 0 0" | sudo tee -a /etc/fstab

# Check the Swap Space after creating the Swap File
free -h

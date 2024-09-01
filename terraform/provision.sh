#!/bin/bash
# Script to provision the VM

# Install git
sudo apt-get update
sudo apt-get install -y git

# Clone the repository
git clone https://github.com/mohsin996/RailsMonitor.git

# Change directory to the repository
cd RailsMonitor

# Run the setup script
chmod +x ./setup.sh
./setup.sh

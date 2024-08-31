#!/bin/bash

# Install Ruby and dependencies
sudo apt-get update
sudo apt install -y curl git

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Create project directory
mkdir hello_world_rails
cd hello_world_rails

# Initialize a new Rails project
docker run --rm -v $(pwd):/myapp -w /myapp ruby:3.0.2 bash -c "gem install rails && rails new . --database=postgresql"

# Update the Gemfile to include Redis
echo "gem 'redis'" >> Gemfile
echo "gem 'prometheus_exporter'" >> Gemfile

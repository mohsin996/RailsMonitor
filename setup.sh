#!/bin/bash

# Function to install Docker
install_docker() {
    echo "Installing Docker..."
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install -y docker-ce
}

# Function to install Docker Compose
install_docker_compose() {
    echo "Installing Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.0.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    install_docker
else
    echo "Docker is already installed."
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    install_docker_compose
else
    echo "Docker Compose is already installed."
fi

# Add current user to docker group if not already in it
if ! groups $USER | grep -q "\bdocker\b"; then
    echo "Adding user to docker group..."
    sudo usermod -aG docker ${USER}
    echo "Please log out and log back in to apply the docker group changes."
    exit 0
else
   echo "User is already in the docker group."
fi

# Navigate to RailsMonitor directory
cd "$(dirname "$0")"

# Check if the RailsMonitor app is running
if docker-compose ps | grep -q "railsmonitor"; then
    echo "RailsMonitor application is already running."
else
    echo "RailsMonitor application is not running. Starting the application..."
    docker-compose up --build -d
fi

# Validation checks
echo "Validating services..."

# Wait a few seconds for services to start
sleep 10

# Check if RailsMonitor app is running
if curl -s http://localhost:3000 | grep -q "Rails"; then
    echo "RailsMonitor app is running and accessible at http://localhost:3000."
else
    echo "RailsMonitor app is not accessible on http://localhost:3000. Please check the logs."
fi

# Check if Grafana is running
if curl -s -o /dev/null -w "%{http_code}" http://localhost:3001/login | grep -q "200"; then
    echo "Grafana is running and accessible at http://localhost:3001."
else
    echo "Grafana is not accessible on http://localhost:3001. Please check the logs."
fi

# Check if Prometheus is running
if curl -s -o /dev/null -w "%{http_code}" http://localhost:9090/graph | grep -q "200"; then
    echo "Prometheus is running and accessible at http://localhost:9090."
else
    echo "Prometheus is not accessible on http://localhost:9090. Please check the logs."
fi

# Done
echo "RailsMonitor application setup and validation is complete."

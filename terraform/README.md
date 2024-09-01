## Prerequisites
- Ensure Terraform(v1.9.4+) is installed: Follow the [official guide](https://developer.hashicorp.com/terraform/install) to install Terraform.

## Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/mohsin996/RailsMonitor.git
   cd RailsMonitor
   ```
2. **Navigate to the Terraform directory:**:
   ```bash
   #Update subscription_id in main.tf file.
   terraform init
   terraform plan
   terraform apply -auto-approve
   ssh azureuser@<public_ip> #if_required
   ```
3. **Access the application**:
   - Rails Web app: http://<public_ip>:3000
   - Prometheus: http://<public_ip>:9090
   - Grafana: http://<public_ip>:3001/login (Username: admin, Password: admin)

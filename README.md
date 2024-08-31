# RailsMonitor
The project RailsMonitor is a "Hello World" Rails application connected to PostgreSQL and Redis, with key services integrated into monitoring. This setup ensures comprehensive tracking of the application's performance and reliability.


## Prerequisites
- Docker (version 27.2.0+)
- Docker Compose (version 1.29+)


## Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/RubyRadar.git
   cd RailsMonitor
   ```


2. **Build and start the application**:
   ```bash
   docker-compose up --build
   ```

3. **Access the application**:
   - Web app: http://localhost:3000
   - Prometheus: http://localhost:9090
   - Grafana: http://localhost:3001 (admin/admin)

5. **Add Prometheus as a data source in Grafana**:
   - URL: `http://prometheus:9090`
   - Add dashboards to visualize your Rails app metrics.

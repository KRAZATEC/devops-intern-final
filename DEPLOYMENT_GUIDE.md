# DevOps Project Deployment Guide

## Complete Deployment Instructions

**Project:** DevOps Final Assessment  
**Author:** T SUBHAM PATRO (KRAZATEC)  
**Date:** January 30, 2026  
**Location:** Nagandenahalli, Karnataka, IN

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Local Development Setup](#local-development-setup)
3. [Docker Deployment](#docker-deployment)
4. [Monitoring Stack Deployment](#monitoring-stack-deployment)
5. [Nomad Deployment](#nomad-deployment)
6. [CI/CD Pipeline](#cicd-pipeline)
7. [Troubleshooting](#troubleshooting)

---

## Prerequisites

### Required Software

- **Git** - Version control
- **Python** 3.9+ - Application runtime
- **Docker** 20.10+ - Containerization
- **Docker Compose** 1.29+ - Container orchestration
- **Bash** - Script execution
- **curl/wget** - HTTP requests

### System Requirements

- **OS:** Linux/macOS/Windows (WSL2)
- **CPU:** 2+ cores
- **RAM:** 4GB+ available
- **Disk:** 10GB+ free space
- **Network:** Internet connectivity

### Installation Verification

```bash
# Check Git
git --version

# Check Python
python3 --version

# Check Docker
docker --version
docker-compose --version
```

---

## Local Development Setup

### 1. Clone the Repository

```bash
git clone https://github.com/KRAZATEC/devops-intern-final.git
cd devops-intern-final
```

### 2. Set Up Python Environment

```bash
# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate  # Linux/macOS
# OR
venv\Scripts\activate     # Windows
```

### 3. Run Python Application

```bash
# Test the application
python hello.py

# Expected output:
# ==================================================
# DevOps Final Assessment Project
# Python Application
# ==================================================
#
# Hello, DevOps!
# Timestamp: 2026-01-30 17:30:45.123456
# Python Version: 3.11.0 (main, Oct 24 2023)
# Platform: linux
# Current Directory: /path/to/project
#
# ==================================================
# Application Status: SUCCESS
# ==================================================
```

### 4. Run System Information Script

```bash
# Make script executable
chmod +x scripts/sysinfo.sh

# Run the script
./scripts/sysinfo.sh

# Expected output:
# ================================================= 
# System Information Report
# =================================================
# [+] Operating System Information
#     OS: Linux
#     Kernel: 5.15.0-x86_64
#     Architecture: x86_64
# ...
```

### 5. Run Backup Script

```bash
# Make script executable
chmod +x scripts/backup.sh

# Run backup
./scripts/backup.sh

# Check backups
ls -lh backups/
```

---

## Docker Deployment

### 1. Build Docker Image

```bash
# Build the image
docker build -t devops-hello:latest .

# Verify image creation
docker images | grep devops-hello
```

### 2. Run Docker Container

```bash
# Run the container
docker run --rm devops-hello:latest

# Run with name
docker run --name devops-app --rm devops-hello:latest

# Run in background
docker run -d --name devops-app devops-hello:latest
docker logs devops-app
```

### 3. Inspect Docker Image

```bash
# View image details
docker inspect devops-hello:latest

# View image history
docker history devops-hello:latest

# Get image size
docker images --format "{{.Repository}}:{{.Tag}} - {{.Size}}"
```

---

## Monitoring Stack Deployment

### 1. Start Monitoring Stack

```bash
cd monitoring

# Start all services
docker-compose up -d

# Verify services are running
docker-compose ps
```

### 2. Access Services

- **Grafana**: http://localhost:3000
  - Username: admin
  - Password: admin

- **Loki**: http://localhost:3100

### 3. Configure Loki Data Source in Grafana

1. Login to Grafana
2. Go to Configuration > Data Sources
3. Add Loki datasource:
   - Name: Loki
   - URL: http://loki:3100
4. Save and test

### 4. View Logs

1. In Grafana, go to Explore
2. Select Loki datasource
3. Query: `{job="devops-logs"}`
4. Run query

### 5. Stop Monitoring Stack

```bash
docker-compose down
```

---

## Nomad Deployment

### 1. Install Nomad

```bash
# Download and install
wget https://releases.hashicorp.com/nomad/1.5.0/nomad_1.5.0_linux_amd64.zip
unzip nomad_1.5.0_linux_amd64.zip
sudo mv nomad /usr/local/bin/

# Verify installation
nomad version
```

### 2. Start Nomad Agent

```bash
# Start in dev mode
nomad agent -dev

# In another terminal:
# Run the job
cd nomad
nomad job run hello.nomad
```

### 3. Monitor Job

```bash
# List jobs
nomad job list

# View job details
nomad job status devops-hello

# View allocations
nomad job allocations devops-hello
```

### 4. Stop Job

```bash
nomad job stop devops-hello
```

---

## CI/CD Pipeline

### 1. GitHub Actions Pipeline

- Automatically triggered on push to `main`
- Location: `.github/workflows/ci.yml`
- Runs tests and builds Docker image

### 2. View Pipeline Status

1. Go to: https://github.com/KRAZATEC/devops-intern-final/actions
2. Click on latest workflow run
3. Review job logs

### 3. Pipeline Steps

- Test job: Python 3.9, 3.10, 3.11
- Docker job: Build and test image
- Security job: Vulnerability scanning

---

## Troubleshooting

### Docker Issues

**Problem**: Docker daemon not running
```bash
# Solution:
sudo systemctl start docker
```

**Problem**: Permission denied while running docker
```bash
# Solution:
sudo usermod -aG docker $USER
newgrp docker
```

### Python Issues

**Problem**: Module not found
```bash
# Solution:
pip install -r requirements.txt
```

### Monitoring Issues

**Problem**: Cannot connect to Grafana
```bash
# Check if containers are running:
docker ps

# View logs:
docker logs devops-grafana
```

### Nomad Issues

**Problem**: Docker driver not available
```bash
# Solution:
nomad node-meta set docker=available
```

---

## Final Checklist

- [ ] Repository cloned successfully
- [ ] Python application runs locally
- [ ] Shell scripts execute without errors
- [ ] Docker image builds successfully
- [ ] Docker container runs and produces output
- [ ] Monitoring stack starts without errors
- [ ] Grafana is accessible at http://localhost:3000
- [ ] CI/CD pipeline passes in GitHub Actions
- [ ] Nomad job deploys successfully
- [ ] All files are committed to Git

---

## Support

For issues or questions, refer to:
- README.md - Project overview
- Individual component documentation
- GitHub Issues

---

**Status:** ✅ Complete and Ready for Deployment

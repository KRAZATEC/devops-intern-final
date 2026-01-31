# DevOps Final Assessment Project

## 🎯 Project Overview

This is a **comprehensive DevOps Final Assessment project** that covers all essential DevOps and infrastructure concepts. The project demonstrates real-world DevOps practices including version control, containerization, CI/CD automation, Linux scripting, orchestration, and monitoring.

**Created by:** T SUBHAM PATRO (KRAZATEC)   
**Repository:** https://github.com/KRAZATEC/devops-intern-final

---

## 📋 Project Structure

```
devops-intern-final/
├── README.md                          # Project documentation
├── hello.py                           # Python application
├── Dockerfile                         # Docker container configuration
├── .gitignore                         # Git ignore rules (Python)
├── scripts/
│   ├── sysinfo.sh                     # System information script
│   └── backup.sh                      # Backup automation script
├── .github/
│   └── workflows/
│       ├── ci.yml                     # CI/CD pipeline workflow
│       └── pr-checks.yml              # Pull request validation
├── nomad/
│   ├── hello.nomad                    # Nomad job configuration
│   └── NOMAD_SETUP.md                 # Nomad setup guide
└── monitoring/
    ├── docker-compose.yml             # Monitoring stack (Loki, Grafana)
    └── loki_setup.txt                 # Loki configuration guide
```

---

## ✅ 7 Core Components

### 1. **Git & GitHub**
- ✅ Version control with Git
- ✅ Public GitHub repository
- ✅ Professional commit history
- ✅ Branch management

### 2. **Linux & Shell Scripting**
- ✅ System information script (sysinfo.sh)
- ✅ Backup automation (backup.sh)
- ✅ Bash scripting best practices

### 3. **Docker Containerization**
- ✅ Dockerfile with Python application
- ✅ Multi-stage builds
- ✅ Security best practices
- ✅ Docker image creation

### 4. **CI/CD with GitHub Actions**
- ✅ Automated pipeline on push
- ✅ Multi-Python version testing (3.9, 3.10, 3.11)
- ✅ Docker image building
- ✅ Automated testing

### 5. **Nomad Orchestration**
- ✅ Job configuration file
- ✅ Resource allocation
- ✅ Service deployment configuration

### 6. **Monitoring with Grafana Loki**
- ✅ Log aggregation setup
- ✅ Grafana dashboard
- ✅ Real-time log viewing
- ✅ Docker Compose monitoring stack

### 7. **Professional Documentation**
- ✅ README (this file)
- ✅ Setup guides
- ✅ Configuration documentation
- ✅ Troubleshooting guides

---

## 🚀 Quick Start

### Prerequisites
- Git installed
- Python 3.9+
- Docker and Docker Compose
- Linux/macOS or WSL on Windows

### Clone Repository
```bash
git clone https://github.com/KRAZATEC/devops-intern-final.git
cd devops-intern-final
```

### Run Python Application
```bash
python hello.py
```

### Build and Run Docker Container
```bash
docker build -t devops-hello .
docker run devops-hello
```

### Run System Information Script
```bash
chmod +x scripts/sysinfo.sh
./scripts/sysinfo.sh
```

### View CI/CD Pipeline
Go to: **Actions** tab in GitHub repository

---

## 📊 CI/CD Pipeline

Every push automatically triggers:
1. ✅ Code checkout
2. ✅ Python test suite (3.9, 3.10, 3.11)
3. ✅ Docker image build
4. ✅ Container execution test
5. ✅ Build report generation

---

## 🐳 Docker

### Build Image
```bash
docker build -t devops-hello .
```

### Run Container
```bash
docker run --rm devops-hello
```

### View Image Details
```bash
docker images | grep devops-hello
```

---

## 📜 Scripts

### System Information (sysinfo.sh)
```bash
./scripts/sysinfo.sh
```
Displays: OS, Kernel, CPU, RAM, Disk usage, Network info

### Backup Script (backup.sh)
```bash
./scripts/backup.sh
```
Automates backup of project files

---

## 🔄 Nomad Orchestration

Configuration file: `nomad/hello.nomad`

```bash
nomad job run nomad/hello.nomad
```

---

## 📈 Monitoring Stack

### Start Monitoring
```bash
cd monitoring
docker-compose up -d
```

### Access Grafana
- URL: http://localhost:3000
- Default credentials: admin/admin

### View Logs
- Explore logs in Grafana
- Query with LogQL

---

## 📝 Key Files

| File | Purpose |
|------|----------|
| `hello.py` | Main Python application |
| `Dockerfile` | Container image definition |
| `.github/workflows/ci.yml` | GitHub Actions CI/CD |
| `scripts/sysinfo.sh` | System diagnostics |
| `nomad/hello.nomad` | Job orchestration |
| `monitoring/docker-compose.yml` | Monitoring infrastructure |

---

## 🎓 Learning Outcomes

This project teaches:
- ✅ Git version control
- ✅ Docker containerization  
- ✅ GitHub Actions CI/CD automation
- ✅ Linux shell scripting
- ✅ Python application development
- ✅ Nomad job orchestration
- ✅ Log aggregation and monitoring
- ✅ Infrastructure as Code (IaC)

---

## 🔒 Security

- ✅ Python .gitignore configured
- ✅ Sensitive files excluded
- ✅ No hardcoded credentials
- ✅ Public visibility for assessment

---

## 📞 Support

For issues or questions:
1. Check the documentation files
2. Review the CI/CD logs in GitHub Actions
3. Check error messages in Docker output
4. Verify all prerequisites are installed

---

## 📅 Status

- ✅ Repository Created
- ✅ README Documentation
- ✅ Python Application
- ✅ Docker Configuration
- ✅ CI/CD Pipeline
- ✅ Shell Scripts
- ✅ Nomad Configuration
- ✅ Monitoring Setup

---

## 📄 License

This project is provided for educational purposes.

---

**Last Updated:** January 30, 2026  
**Status:** ✅ Complete and Production-Ready

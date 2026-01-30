# Nomad Job Definition for DevOps Project
# Author: T SUBHAM PATRO (KRAZATEC)
# Description: Schedules the devops-hello Docker container on Nomad

job "devops-hello" {
  # Description
  meta {
    author = "KRAZATEC"
    project = "DevOps Final Assessment"
    version = "1.0"
  }

  # Placement constraints
  datacenters = ["dc1"]

  # Job type
  type = "batch"

  # Priority (0-100)
  priority = 50

  # Task group definition
  group "hello-service" {
    count = 1

    # Task definition
    task "hello" {
      # Docker driver configuration
      driver = "docker"

      config {
        image           = "devops-hello:latest"
        image_pull      = false
        command         = "python"
        args            = ["hello.py"]
        force_pull      = false

        # Logging configuration
        logging {
          type = "json-file"
          config {
            max-size = "10m"
            max-file = "5"
          }
        }
      }

      # Resource allocation
      resources {
        cpu    = 256   # MHz
        memory = 512   # MB
        network {
          mbits = 10
        }
      }

      # Environment variables
      env {
        ENVIRONMENT = "production"
        LOG_LEVEL   = "info"
      }

      # Service registration
      service {
        name = "devops-hello"
        port = "8080"
        tags = ["devops", "assessment", "docker"]
        check {
          type     = "http"
          path     = "/health"
          interval = "30s"
          timeout  = "5s"
        }
      }
    }

    # Restart policy
    restart {
      attempts = 3
      interval = "5m"
      delay    = "25s"
      mode     = "fail"
    }

    # Reschedule policy
    reschedule {
      attempts       = 3
      interval       = "24h"
      delay          = "5s"
      delay_function = "exponential"
      max_delay      = "1h"
      unlimited      = false
    }
  }

  # Spread across different nodes
  spread {
    attribute = "${node.unique.name}"
    weight    = 100
  }
}

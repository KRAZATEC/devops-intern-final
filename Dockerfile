# Multi-stage Dockerfile for DevOps Project
# Stage 1: Build stage
FROM python:3.11-slim as builder

WORKDIR /app

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy application files
COPY hello.py .
# Install Python dependencies (if requirements.txt exists)
RUN pip install --no-cache-dir --user -r requirements.txt || true


# Stage 2: Runtime stage
FROM python:3.11-slim

WORKDIR /app

# Create non-root user for security
RUN useradd -m -u 1000 devops

# Copy from builder
# Optional: Skip copying .local if requirements.txt wasn't installed
COPY --from=builder /app/hello.py .

# Set environment variables
ENV PATH=/home/devops/.local/bin:$PATH \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Switch to non-root user
USER devops

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD python hello.py || exit 1

# Run the application
CMD ["python", "hello.py"]

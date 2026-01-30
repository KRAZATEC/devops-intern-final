#!/bin/bash
#
# Backup Script
# DevOps Final Assessment Project
# Author: T SUBHAM PATRO (KRAZATEC)
#

set -e

# Configuration
BACKUP_DIR="./backups"
PROJECT_FILES=("hello.py" "Dockerfile" "README.md" ".gitignore" "scripts/" ".github/" "nomad/" "monitoring/")
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

echo "================================================="
echo "        DevOps Project Backup Script"
echo "================================================="
echo ""

# Create backup directory
echo "[*] Creating backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"
echo "[+] Backup directory ready"
echo ""

# Create backup archive
echo "[*] Creating backup archive: $BACKUP_FILE"
tar -czf "$BACKUP_FILE" "${PROJECT_FILES[@]}" 2>/dev/null || true
echo "[+] Archive created successfully"
echo ""

# Display backup info
if [ -f "$BACKUP_FILE" ]; then
    BACKUP_SIZE=$(du -h "$BACKUP_FILE" | awk '{print $1}')
    echo "[+] Backup Information:"
    echo "    File: $BACKUP_FILE"
    echo "    Size: $BACKUP_SIZE"
    echo "    Created: $(date)"
    echo ""
    echo "[+] Backup completed successfully!"
else
    echo "[-] Error: Backup file not created"
    exit 1
fi

# Cleanup old backups (keep last 5)
echo ""
echo "[*] Cleaning up old backups (keeping last 5)..."
BACKUP_COUNT=$(ls -1 "$BACKUP_DIR" | wc -l)
if [ "$BACKUP_COUNT" -gt 5 ]; then
    ls -1t "$BACKUP_DIR" | tail -n +6 | while read -r old_backup; do
        echo "    Removing: $old_backup"
        rm -f "$BACKUP_DIR/$old_backup"
    done
    echo "[+] Old backups cleaned up"
else
    echo "[+] Backup count: $BACKUP_COUNT (no cleanup needed)"
fi

echo ""
echo "================================================="
echo "        Backup Complete"
echo "================================================="

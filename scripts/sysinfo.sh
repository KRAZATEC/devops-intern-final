#!/bin/bash
#
# System Information Script
# DevOps Final Assessment Project
# Author: T SUBHAM PATRO (KRAZATEC)
#

echo "================================================="
echo "        System Information Report"
echo "================================================="
echo ""

echo "[+] Operating System Information"
echo "    OS: $(uname -s)"
echo "    Kernel: $(uname -r)"
echo "    Architecture: $(uname -m)"
echo ""

echo "[+] Host Information"
echo "    Hostname: $(hostname)"
echo "    Domain: $(hostname -d 2>/dev/null || echo 'Not configured')"
echo ""

echo "[+] CPU Information"
echo "    CPU Cores: $(nproc)"
echo "    CPU Model: $(lscpu | grep 'Model name' | cut -d':' -f2 | xargs)"
echo ""

echo "[+] Memory Information"
echo "    Total RAM: $(free -h | grep Mem | awk '{print $2}')"
echo "    Used RAM: $(free -h | grep Mem | awk '{print $3}')"
echo "    Available RAM: $(free -h | grep Mem | awk '{print $7}')"
echo ""

echo "[+] Disk Information"
echo "    Root Filesystem:"
df -h / | tail -1 | awk '{print "      Size: " $2 ", Used: " $3 ", Available: " $4 ", Usage: " $5}'
echo ""

echo "[+] Network Interfaces"
ip -br link show | while read -r line; do
    echo "    $line"
done
echo ""

echo "[+] IP Addresses"
ip addr show | grep "inet " | awk '{print "    " $NF ": " $2}'
echo ""

echo "[+] Uptime"
echo "    $(uptime -p)"
echo ""

echo "[+] Date and Time"
echo "    $(date '+%Y-%m-%d %H:%M:%S %Z')"
echo ""

echo "================================================="
echo "        End of Report"
echo "================================================="

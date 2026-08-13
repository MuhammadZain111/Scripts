#!/bin/bash

echo "======================================"
echo "        SYSTEM HEALTH CHECK"
echo "======================================"

HEALTHY=true

# CPU Usage
CPU=$(top -bn1 | awk '/Cpu/ {print 100 - $8}')
echo "CPU Usage: $CPU%"

# RAM Usage
RAM=$(free | awk '/Mem/ {printf "%.0f", $3/$2 * 100}')
echo "RAM Usage: $RAM%"

# Disk Usage
DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
echo "Disk Usage: $DISK%"

# Server Uptime
echo "Server Uptime:"
uptime -p

# Running Processes
PROCESS_COUNT=$(ps -e --no-headers | wc -l)
echo "Running Processes: $PROCESS_COUNT"

# Failed Services
FAILED=$(systemctl --failed --no-legend | wc -l)
echo "Failed Services: $FAILED"

# Internet Connection
if ping -c 1 -W 2 google.com > /dev/null 2>&1
then
    echo "Internet: Working"
else
    echo "Internet: Not Working"
    HEALTHY=false
fi

# Health Conditions
if (( ${CPU%.*} > 90 )); then
    HEALTHY=false
fi

if [ "$RAM" -gt 90 ]; then
    HEALTHY=false
fi

if [ "$DISK" -gt 90 ]; then
    HEALTHY=false
fi

if [ "$FAILED" -gt 0 ]; then
    HEALTHY=false
fi

echo "======================================"

if [ "$HEALTHY" = true ]; then
    echo "Overall System Health: HEALTHY"
else
    echo "Overall System Health: NOT HEALTHY"
fi

echo "======================================"

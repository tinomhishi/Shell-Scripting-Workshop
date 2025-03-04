#!/bin/bash
LOG_DIR="TEMP"
# Find and delete .log files older than 1 minute
find "$LOG_DIR" -type f -name "*.txt" -mmin +1 -exec rm {} \;
echo "Old logs cleaned up!"
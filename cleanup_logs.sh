

#!/bin/bash

echo "-----------------------------------------"


LOG_DIR="/var/log"
ARCHIVE_DIR="/var/log/archive"
REPORT="cleanup_report.txt"

mkdir -p "$ARCHIVE_DIR"



echo "======================================" > "$REPORT"
echo "       LOG CLEANUP REPORT" >> "$REPORT"
echo "Date: $(date)" >> "$REPORT"
echo "======================================" >> "$REPORT"

echo "Finding .log files older than 30 days..."

echo  "--------------------------------------"



find "$LOG_DIR" -type f -name "*.log" -mtime +30 -print > /tmp/old_logs.txt

COUNT=0

while read -r LOG_FILE
do
    echo "Compressing: $LOG_FILE"

    gzip "$LOG_FILE"

    mv "$LOG_FILE.gz" "$ARCHIVE_DIR/"

    echo "$LOG_FILE" >> "$REPORT"

    ((COUNT++))
done < /tmp/old_logs.txt



echo "Files compressed and archived: $COUNT" >> "$REPORT"

echo "Deleting archives older than 90 days..."

DELETED=$(find "$ARCHIVE_DIR" -type f -name "*.gz" -mtime +90 -print -delete | wc -l)

echo "Archives deleted: $DELETED" >> "$REPORT"

echo "======================================" >> "$REPORT"
echo "Cleanup completed: $(date)" >> "$REPORT"
echo "======================================" >> "$REPORT"

echo "Cleanup completed."
echo "Files archived: $COUNT"
echo "Old archives deleted: $DELETED"
echo "Report: $REPORT"

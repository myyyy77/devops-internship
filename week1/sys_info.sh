#!/bin/bash
# Script recuperat: System Reconnaissance

FILE="report.txt"
if [ -f "$FILE" ]; then
    mv "$FILE" "${FILE}.bak"
fi

echo "--- RAPORT SISTEM ---" > $FILE
echo "Utilizator: $USER" >> $FILE
echo "Kernel: $(uname -r)" >> $FILE
echo "Uptime: $(uptime -p)" >> $FILE
echo "Spatiu Disc:" >> $FILE
df -h / | grep '/' >> $FILE
echo "Creat la: $(date)" >> $FILE

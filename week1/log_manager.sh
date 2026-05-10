#!/bin/bash
# Script recuperat: Log Architect

DATA=$(date +%Y%m%d)
ARHIVA="logs_archive_${DATA}.tar.gz"

echo "Se caută și se arhivează log-urile modificate recent..."
# Găsim fișiere modificate în ultimele 24 ore (>100KB) și le arhivăm în Home
find /var/log -mtime -1 -size +100k -type f 2>/dev/null | tar -cvzf ~/$ARHIVA -T -

# Numărarea erorilor în syslog
if [ -f /var/log/syslog ]; then
    COUNT=$(grep -i "error" /var/log/syslog | wc -l)
    echo "Total erori găsite în syslog: $COUNT"
else
    echo "Fișierul syslog nu a fost găsit."
fi

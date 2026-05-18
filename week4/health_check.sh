#!/bin/bash

echo "=== VERIFICARE STARE SISTEM ==="

# 1. Verificăm utilizarea discului pe partiția root (/)
SPATIU_DISC=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$SPATIU_DISC" -gt 80 ]; then
    echo "DISK CRITICAL: $SPATIU_DISC%"
else
    echo "Spațiu Disc: OK ($SPATIU_DISC%)"
fi

# 2. Verificăm memoria RAM liberă (în MB)
RAM_LIBER=$(free -m | awk '/Mem:/ {print $4}')
LOG_ERORI="$HOME/system_errors.log"

if [ "$RAM_LIBER" -lt 100 ]; then
    echo "$(date): ALERTĂ - RAM sub 100MB! Liber: ${RAM_LIBER}MB" >> "$LOG_ERORI"
    echo "RAM CRITICAL: Memorie extrem de puțină! Verifică $LOG_ERORI"
else
    echo "Memorie RAM: OK (${RAM_LIBER}MB liberi)"
fi

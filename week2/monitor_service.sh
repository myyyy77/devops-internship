#!/bin/bash

# Verificăm dacă am primit numele procesului ca argument [cite: 71, 75]
if [ -z "$1" ]; then
    echo "Utilizare: $0 [nume_proces]"
    exit 1
fi

SERVICE=$1

# Căutăm procesul și extragem PID-ul [cite: 75]
PID=$(pgrep -x "$SERVICE")

if [ -n "$PID" ]; then
    # Dacă procesul rulează, afișăm PID-ul [cite: 72]
    echo "Process [$SERVICE] is running with PID: $PID"
else
    # Dacă nu rulează, afișăm o alertă [cite: 73]
    echo "WARNING: [$SERVICE] is not running!"
fi

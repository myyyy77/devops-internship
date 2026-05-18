#!/bin/bash

# Oprește scriptul dacă vreo comandă eșuează critic
set -e

if [ -z "$1" ]; then
    echo "Utilizare: $0 /cale/catre/access.log"
    exit 10
fi

LOG_FILE=$1

if [ ! -f "$LOG_FILE" ]; then
    echo "Eroare: Fișierul de log nu există!"
    exit 10
fi

echo "=== PARSARE LOG DE PRODUCȚIE ==="

# 1. Numărăm cererile GET și POST
GET_COUNT=$(grep -c "GET" "$LOG_FILE" || echo 0)
POST_COUNT=$(grep -c "POST" "$LOG_FILE" || echo 0)

echo "Ceri GET totale: $GET_COUNT"
echo "Ceri POST totale: $POST_COUNT"

# 2. Identificăm IP-ul cu cele mai multe erori 404
echo "IP-ul care a generat cele mai multe erori 404:"
# Presupunem un format standard unde IP-ul e primul element, căutăm "404"
IP_404=$(grep "404" "$LOG_FILE" | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 1)

if [ -n "$IP_404" ]; then
    echo "  [Apariții - IP]: $IP_404"
else
    echo "  Nu s-au găsit erori 404 în acest log."
fi

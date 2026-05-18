#!/bin/bash

echo "=== VERIFICARE CONECTIVITATE ==="

# Trimitem 2 pachete ping către DNS-ul Google (8.8.8.8) 
# Redirecționăm output-ul spre /dev/null ca să nu murdărim ecranul
if ping -c 2 8.8.8.8 &> /dev/null; then
    echo "REȚEA: Conectat"

    # Folosim curl pentru a afla IP-ul public
    IP_PUBLIC=$(curl -s ifconfig.me)
    echo "IP-ul tău public este: $IP_PUBLIC"
else
    echo "REȚEA: Deconectat"
fi

#!/bin/bash

# Verificăm dacă utilizatorul a introdus un domeniu ca argument
if [ -z "$1" ]; then
    echo "Utilizare: $0 [domeniu.com]"
    exit 1
fi

DOMENIU=$1

echo "=== AUDIT DNS PENTRU: $DOMENIU ==="

# 1. Extragem adresele IPv4 (A Records)
echo -e "\n[A Records - Adrese IP]:"
host -t A "$DOMENIU" | awk '/has address/ {print $4}'

# 2. Identificăm serverele de mail (MX Records)
echo -e "\n[MX Records - Servere de Mail]:"
host -t MX "$DOMENIU"

# 3. Folosim traceroute pentru a vedea ultimul pas (hop)
echo -e "\n[Ultimul pas din rețea (Traceroute)]:"
# Rulăm traceroute pe portul 80 (web) și luăm doar ultima linie validă
traceroute -q 1 "$DOMENIU" 2>/dev/null | tail -n 1

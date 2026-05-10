#!/bin/bash
# Script recuperat: Security Check

echo "Fisiere World Writable in Home:"
find ~ -maxdepth 2 -perm -o+w -type f

echo "Verificare grup interns:"
if grep -q "interns" /etc/group; then
    echo "Grupul 'interns' este prezent."
else
    echo "WARNING: Grupul 'interns' nu exista!"
fi

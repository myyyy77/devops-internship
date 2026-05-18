#!/bin/bash

# Verificăm dacă utilizatorul a introdus argumentul obligatoriu
if [ -z "$1" ]; then
    echo "Utilizare: $0 /cale/catre/folder"
    exit 1
fi

SURSA=$1
DESTINATIE="/tmp/backups"
DATA=$(date +%Y-%m-%d)
NUME_ARHIVA="backup_$DATA.tar.gz"

# Verificăm dacă folderul sursă există în realitate
if [ ! -d "$SURSA" ]; then
    echo "Eroare: Folderul $SURSA nu există!"
    exit 2
fi

# Creăm folderul de destinație dacă nu există deja
mkdir -p "$DESTINATIE"

# Creăm arhiva comprimată
tar -czf "$DESTINATIE/$NUME_ARHIVA" -C "$(dirname "$SURSA")" "$(basename "$SURSA")"

echo "Succes! Arhiva a fost salvată în: $DESTINATIE/$NUME_ARHIVA"

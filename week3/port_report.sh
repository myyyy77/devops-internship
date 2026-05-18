#!/bin/bash

echo "=== RAPORT PORTURI ACTIVE (LISTENING) ==="
echo "PORT - NUME_PROCES - PID"
echo "----------------------------------------"

# Folosim ss (socket statistics) pentru a găsi porturile TCP care ascultă (-l)
# și procesele lor (-p). Curățăm textul cu awk.
ss -tlnp 2>/dev/null | awk 'NR>1 {
    split($4, addr, ":"); 
    port=addr[length(addr)]; 
    match($7, /users:\(\("([^"]+)",pid=([0-9]+)/, m);
    if (port != "") {
        printf "%-8s - %-12s - %s\n", port, (m[1] ? m[1] : "unknown"), (m[2] ? m[2] : "unknown")
    }
}'

echo "----------------------------------------"
echo "=== VERIFICARE SECURITATE SSH ==="

# Verificăm dacă portul 22 este deschis în starea de LISTENING
if ss -tln | grep -q ":22 "; then
    echo "SECURITY ALERT: SSH port is open!"
else
    echo "Status SSH: Portul 22 este închis sau securizat."
fi

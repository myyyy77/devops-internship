#!/usr/bin/env python3
import requests
import os

print("=== VERIFICARE STATUS URL-URI ===")

# Verificăm dacă fișierul cu site-uri există
if not os.path.exists("websites.txt"):
    print("Eroare: Fișierul websites.txt nu a fost găsit!")
    exit(1)

# Citim site-urile din fișier
with open("websites.txt", "r") as file:
    urls = [line.strip() for line in file if line.strip()]

# Verificăm fiecare URL în parte
for url in urls:
    try:
        # Facem o cerere HTTP GET cu un timeout de 5 secunde
        response = requests.get(url, timeout=5)
        if response.status_code == 200:
            print(f"[UP] {url} - Status: 200 OK")
        else:
            print(f"[DOWN] {url} - Status: {response.status_code}")
    except requests.exceptions.RequestException:
        print(f"[DOWN] {url} - Conexiune eșuată sau URL invalid")

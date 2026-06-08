#!/usr/bin/env python3
import yaml
import json
import os

# Definim excepția personalizată cerută în sarcină
class MissingRequiredConfigError(Exception):
    pass

print("=== VALIDATOR CONFIGURARE: YAML -> JSON ===")

if not os.path.exists("app_config.yaml"):
    print("Eroare: Fișierul app_config.yaml nu există!")
    exit(1)

# Citim fișierul YAML
with open("app_config.yaml", "r") as y_file:
    try:
        config_data = yaml.safe_load(y_file)
    except yaml.YAMLError as e:
        print("Eroare la parsarea fișierului YAML:", e)
        exit(1)

# Validăm existența cheilor obligatorii
try:
    if "database" not in config_data or "port" not in config_data:
        raise MissingRequiredConfigError("Structura de configurare INVALIDĂ: Cheile obligatorii 'database' sau 'port' lipsesc!")

    print("Validare reușită! Cheile obligatorii sunt prezente.")

    # Convertim și salvăm în JSON
    with open("app_config.json", "w") as j_file:
        json.dump(config_data, j_file, indent=4)
    print("Conversie finalizată. Fișierul 'app_config.json' a fost generat.")

except MissingRequiredConfigError as error:
    print(f"❌ EROARE CRITICĂ DE VALIDARE: {error}")
    exit(10)

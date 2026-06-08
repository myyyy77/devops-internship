#!/usr/bin/env python3
import psutil
import json
import datetime

print("=== COLECTARE METRICI SISTEM ===")

# Colectăm datele folosind psutil
cpu_usage = psutil.cpu_percent(interval=1)
ram = psutil.virtual_memory()
disk = psutil.disk_usage('/')

ram_free_percent = (ram.available / ram.total) * 100
ram_available_gb = round(ram.available / (1024**3), 2)

# Pregătim structura de date (Dicționarul)
metrics_data = {
    "timestamp": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
    "cpu_usage_percent": cpu_usage,
    "ram": {
        "usage_percent": ram.percent,
        "available_gb": ram_available_gb,
        "free_percent": round(ram_free_percent, 2)
    },
    "disk": {
        "usage_percent": disk.percent,
        "free_gb": round(disk.free / (1024**3), 2)
    }
}

# Logica de alertă cerută
if cpu_usage > 80:
    print(f"⚠️ ALERTĂ: Utilizare CPU critică! ({cpu_usage}%)")
if ram_free_percent < 15:
    print(f"⚠️ ALERTĂ: Memorie RAM liberă sub 15%! (Liber: {ram_available_gb} GB)")

# Salvăm datele în format JSON
with open("metrics_output.json", "w") as json_file:
    json.dump(metrics_data, json_file, indent=4)

print("Metricile au fost exportate cu succes în 'metrics_output.json'.")

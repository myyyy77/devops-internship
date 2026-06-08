from flask import Flask
from redis import Redis
import os

app = Flask(__name__)

# Conectare la serviciul Redis din stivă
redis = Redis(host='redis-db', port=6379, decode_responses=True)

@app.route('/')
def index():
    visits = redis.incr('hits')
    # Citim variabila APP_COLOR injectată din .env (dacă lipsește, pune black)
    color = os.getenv('APP_COLOR', 'black')
    
    return f"""
    <div style='text-align:center; padding-top:50px; font-family:sans-serif;'>
        <h1 style='color: {color};'>Săptămâna 7: Producție Locală</h1>
        <p style='font-size: 18px;'>Această pagină a fost accesată de <b>{visits}</b> ori.</p>
        <hr style='width:25%;'>
        <p>Traficul este redirecționat securizat prin <b>Nginx Reverse Proxy</b>!</p>
    </div>
    """

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

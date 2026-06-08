from flask import Flask
from redis import Redis
import os

app = Flask(__name__)
redis = Redis(host='redis-db', port=6379, decode_responses=True)

@app.route('/')
def index():
    visits = redis.incr('hits')
    app_color = os.getenv('APP_COLOR', 'black')
    return f"<h1 style='color: {app_color};'>Hello, DevOps Stack!</h1><p>Această pagină a fost accesată de {visits} ori.</p>"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

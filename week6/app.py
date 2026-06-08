from flask import Flask
from redis import Redis
import os

app = Flask(__name__)

# Ne conectăm la serviciul 'redis-db' (numele containerului din rețeaua Docker)
redis = Redis(host='redis-db', port=6379, decode_responses=True)

@app.route('/')
def hello_devops():
    # Incrementăm numărul de vizite în baza de date la fiecare accesare a paginii
    visits = redis.incr('hits')
    return f"<h1>Hello, DevOps Stack!</h1><p>Această pagină a fost accesată de {visits} ori.</p>"

if __name__ == '__main__':
    # Rulăm pe portul 5000, deschis pentru exterior
    app.run(host='0.0.0.0', port=5000)

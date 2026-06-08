#!/bin/bash
docker build -t flask-alpine-app:latest .
docker run -d -p 5000:5000 --name running-flask-app flask-alpine-app:latest
echo "Containerul a fost pornit pe portul 5000."

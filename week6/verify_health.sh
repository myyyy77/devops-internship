#!/bin/bash
echo "Verificare stare de sănătate Redis..."
docker inspect --format='{{json .State.Health.Status}}' week6-redis-db-1

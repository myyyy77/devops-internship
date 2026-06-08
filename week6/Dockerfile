FROM python:3.9-alpine

WORKDIR /app

# Copiem dependențele și le instalăm fără a păstra cache-ul (pentru o imagine mai mică)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Securizare: Creăm un utilizator de sistem 'devops_user' și rulăm aplicația sub el
RUN adduser -D devops_user
USER devops_user

EXPOSE 5000

CMD ["python", "app.py"]

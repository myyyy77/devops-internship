FROM python:3.9-alpine
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py .
RUN adduser -D devops_user
USER devops_user
EXPOSE 5000
CMD ["python", "app.py"]

# Dockerfile

FROM python:3.8-slim
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_DEBUG=True
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir --upgrade -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "5000"]

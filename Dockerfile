FROM tensorflow/tensorflow:latest  # or specify a compatible Python version if using python:3.x

RUN apt update -y && apt install awscli -y
WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /app

CMD ["python3","app.py"]
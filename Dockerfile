# Use a compatible base image
FROM python:3.11-slim
FROM tensorflow/tensorflow:latest

# Set up the working directory
WORKDIR /app

# Copy requirements and upgrade pip
COPY requirements.txt .
RUN apt update -y && apt install awscli -y
RUN pip install --upgrade pip
RUN pip install --no-cache-dir --ignore-installed -r requirements.txt

# Copy application files
COPY . /app

# Define the command to run your application
CMD ["python3", "app.py"]

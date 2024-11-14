# Use a compatible base image
FROM tensorflow/tensorflow:latest

# Install necessary utilities
RUN apt update -y && apt install awscli -y

# Set up the working directory
WORKDIR /app

# Copy requirements and upgrade pip
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy application files
COPY . /app

# Define the command to run your application
CMD ["python3", "app.py"]

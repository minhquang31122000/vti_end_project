# Base image
FROM python:3.8-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

# Run the application
CMD ["python", "main.py"]

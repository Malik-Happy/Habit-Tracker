# Use an official Python image as the base
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies, including SQLite3
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    nginx \
    pkg-config \
    default-libmysqlclient-dev \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project code
COPY . .

# Expose port 8000
EXPOSE 8000

# Run migrations
RUN ["python", "manage.py", "migrate"]

# Run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

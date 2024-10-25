# Use an official Python image as the base
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install dependencies
CMD sudo apt install nginx -y


# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy project code
COPY . .

# Expose port 8000
EXPOSE 8000

# Run migrations
RUN python manage.py migrate

# Run command
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]



FROM python:3

# Set the working directory
WORKDIR  /var/lib/jenkins/workspace/habitapp

# Copy requirements.txt into the image
COPY requirements.txt .

# Install the dependencies
RUN pip install -r requirements.txt

# Run database migrations
RUN python manage.py migrate

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]



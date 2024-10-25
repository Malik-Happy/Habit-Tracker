# Use the official Python image as a base
FROM python:3

RUN pip install -r requirements.txt


COPY . .

# Run database migrations
RUN python manage.py migrate

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

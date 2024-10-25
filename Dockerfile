FROM python:3

# Set the working directory
WORKDIR /app

# Copy requirements.txt into the container
COPY requirements.txt .

# Install the required packages
RUN pip install -r requirements.txt

# Copy the rest of your application code
COPY . .

# Specify the command to run your app
CMD ["python", "manage.py" ,"runserver","0.0.0.0:8000"]  # or whatever your entry point is

# Use an official Python runtime as the base image
FROM python:3.12.2-slim-bullseye

# Set the working directory inside the container
WORKDIR /app

RUN apt-get update && apt-get install -y \
    libpq-dev gcc


# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project code
COPY . .

# Expose the default Django port
EXPOSE 8000

# Run Django's development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]



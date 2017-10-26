#!/bin/bash
# This script initializes the Django project. It will be executed (from 
# supervisord) every time the Docker image is run.

# If we're not in production, create a temporary dev database
# Initialize Django project
python /code/src/manage.py collectstatic --noinput
python /code/src/manage.py makemigrations
python /code/src/manage.py migrate --noinput

echo "Starting up server on 0.0.0.0:8000"
python3 /code/src/manage.py runserver 0.0.0.0:8000

#!/bin/bash
# This script initializes the Django project. It will be executed (from 
# supervisord) every time the Docker image is run.

# If we're not in production, create a temporary dev database
# Initialize Django project
python /code/django_docker/manage.py collectstatic --noinput
python /code/django_docker/manage.py makemigrations
python /code/django_docker/manage.py migrate --noinput

python3 /code/django_docker/manage.py runserver 0.0.0.0:8000

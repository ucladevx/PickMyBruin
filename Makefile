default: build
clean:

build: 
	docker build -t pickmybruin/backend .	

run: 
	-docker kill `docker ps -q --filter ancestor=pickmybruin/backend:latest`
	docker run -d -p 18080:80 -v `pwd`/django_docker:/code/django_docker --env DJANGO_PRODUCTION=false pickmybruin/backend:latest

ssh: 
	docker exec -i -t `docker ps -q -l --filter ancestor=pickmybruin/backend:latest` /bin/bash

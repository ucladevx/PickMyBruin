default: build
clean:

build: 
	docker build -t pickmybruin/backend .	

run: build
	-docker kill `docker ps -q --filter ancestor=pickmybruin/backend:latest`
	docker run -d -p 18080:80 -v django_docker:/code --env DJANGO_PRODUCTION=false pickmybruin/backend:latest

ssh: 
	docker exec -i -t `docker ps -q -l --filter ancestor=pickmybruin/backend:latest` /bin/bash

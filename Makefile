default: build
clean:

build: 
	docker build -t pickmybruin/backend .	

run: 
	-pkill docker-compose
	docker-compose up

ssh: 
	docker exec -i -t `docker ps -q -l --filter ancestor=pickmybruin/backend:latest` /bin/bash

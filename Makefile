default: build

clean:

build: 
	docker build -t pickmybruin/backend .	

run: 
	-pkill docker-compose
	docker-compose up

restart:
	docker-compose restart web

ssh: 
	docker exec -i -t `docker ps -q -l --filter ancestor=pickmybruin/backend:latest` /bin/bash

# usage: make run_command cmd="echo hi"
run_command:
	docker exec -i -t `docker ps -q -l --filter ancestor=pickmybruin/backend:latest` /bin/bash -c "$(cmd)"

shell:
	docker exec -i -t `docker ps -q -l --filter ancestor=pickmybruin/backend:latest` /bin/bash -c "/code/src/manage.py shell_plus"

test:
	docker exec -i -t `docker ps -q -l --filter ancestor=pickmybruin/backend:latest` /bin/bash -c "cd /code/src && ./manage.py test --no-input --parallel "

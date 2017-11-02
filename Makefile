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

init_db:
	cat init_db.sql | docker exec -i `docker ps -q -l --filter ancestor=postgres` psql -U postgres 

backup_db:
	docker exec -t `docker ps -q -l --filter ancestor=postgres` pg_dumpall -c -U postgres > pickmybruin_dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql


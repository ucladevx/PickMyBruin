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
	docker exec -i -t `docker ps -q --filter status=running --filter ancestor=pickmybruin/backend:latest` /bin/bash

# usage: make run_command cmd="echo hi"
run_command:
	docker exec -i -t `docker ps -q --filter status=running --filter ancestor=pickmybruin/backend:latest` /bin/bash -c "$(cmd)"

shell:
	docker exec -i -t `docker ps -q --filter status=running --filter ancestor=pickmybruin/backend:latest` /bin/bash -c "/code/src/manage.py shell_plus"

test:
	docker exec -i -t `docker ps -q --filter status=running --filter ancestor=pickmybruin/backend:latest` /bin/bash -c "cd /code/src && ./manage.py test --no-input --parallel "

clean_db:
	echo 'DROP SCHEMA public CASCADE; CREATE SCHEMA public;' | docker exec -i `docker ps -q --filter status=running --filter ancestor=postgres:10.1-alpine` psql -U postgres 

init_db: clean_db 
	cat init_db.sql | docker exec -i `docker ps -q --filter status=running --filter ancestor=postgres:10.1-alpine` psql -U postgres 
	docker exec -i -t `docker ps -q --filter status=running --filter ancestor=pickmybruin/backend:latest` /bin/bash -c "cd /code/src && ./manage.py migrate"

restore-db:

backup_db:
	docker exec -t `docker ps -q --filter status=running --filter ancestor=postgres:10.1-alpine` pg_dumpall -c -U postgres > pickmybruin_dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql


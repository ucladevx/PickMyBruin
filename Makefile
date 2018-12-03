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
	docker exec -i -t `docker ps -q --filter status=running --filter ancestor=pickmybruin/backend:latest` /bin/sh

# usage: make run_command cmd="echo hi"
run_command:
	docker exec -i -t `docker ps -q --filter status=running --filter ancestor=pickmybruin/backend:latest` /bin/sh -c "$(cmd)"

shell:
	docker exec -i -t `docker ps -q --filter status=running --filter ancestor=pickmybruin/backend:latest` /bin/sh -c "/code/src/manage.py shell_plus"

test:
	docker exec -i -t `docker ps -q --filter status=running --filter ancestor=pickmybruin/backend:latest` /bin/sh -c "cd /code/src && ./manage.py test --no-input --parallel $(args)" 

clean_db:
	docker-compose exec db psql -U postgres -c 'DROP SCHEMA public CASCADE; CREATE SCHEMA public;'

#Activate extensions
activate_db:
	docker-compose exec db psql -U postgres -c 'CREATE EXTENSION IF NOT EXISTS pg_trgm;'

init_db: clean_db activate_db
	cat init_db.sql | docker exec -i `docker-compose ps -q db` psql -U postgres 
	docker-compose exec web /bin/bash -c "cd /code/src && ./manage.py migrate"

restore-db:

backup_db:
	docker exec -t `docker ps -q --filter status=running --filter ancestor=postgres:10.1-alpine` pg_dumpall -c -U postgres > pickmybruin_dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql

save_requirements:
	docker exec -i -t `docker ps -q --filter status=running --filter ancestor=pickmybruin/backend:latest` /bin/sh -c "pip3 freeze" | tail -n +2 > requirements.txt

install_package:
	docker exec -i -t `docker ps -q --filter status=running --filter ancestor=pickmybruin/backend:latest` /bin/sh -c "pip3 install $(pkg)"
	docker exec -i -t `docker ps -q --filter status=running --filter ancestor=pickmybruin/backend:latest` /bin/sh -c "pip3 freeze" | tail -n +2 > requirements.txt


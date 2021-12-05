DOCKER-COMPOSE_FILE=./srcs/docker-compose.yml
HOME=/home/tcynthia

all: mkdir up

mkdir:
	sudo mkdir ${HOME}/data || true
	sudo mkdir ${HOME}/data/mariadb || true
	sudo mkdir ${HOME}/data/wordpress || true

up:
	docker-compose -f ${DOCKER-COMPOSE_FILE} up -d

stop:
	docker-compose -f ${DOCKER-COMPOSE_FILE} stop

down:
	docker-compose -f ${DOCKER-COMPOSE_FILE} down

ps:
	docker-compose -f ${DOCKER-COMPOSE_FILE} ps

docps:
	docker ps -a

images:
	docker-compose -f ${DOCKER-COMPOSE_FILE} images

docimages:
	docker images

lsnet:
	docker network ls

lsvol:
	docker volume ls

re: down
	docker-compose -f ${DOCKER-COMPOSE_FILE} up --build -d

fclean: down
	bash remove.sh

full-re: fclean all

git:
	git add .
	git commit -m "inc"
	git push

.PHONY: all down fclean re

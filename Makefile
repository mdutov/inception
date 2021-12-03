DOCKER-COMPOSE_FILE=./srcs/docker-compose.yml
HOME=/home/tcynthia

all:
	sudo mkdir ${HOME}/data || true
	sudo mkdir ${HOME}/data/mariadb || true
	sudo mkdir ${HOME}/data/wordpress || true
	make up
ps:
	docker-compose -f ${DOCKER-COMPOSE_FILE} ps
images:
	docker-compose -f ${DOCKER-COMPOSE_FILE} images
ls:
	docker network ls
down:
	docker-compose -f ${DOCKER-COMPOSE_FILE} down
up:
	docker-compose -f ${DOCKER-COMPOSE_FILE} up -d
re:
	docker-compose -f ${DOCKER-COMPOSE_FILE} up --build
rm: down
	docker rm mariadb nginx wordpress
fclean: down
	bash remove.sh
full-re: fclean all
git:
	git add .
	git commit -m "inc"
	git push
.PHONY: all down fclean re

DOCKER-COMPOSE_FILE=requirements/docker-compose.yml

all:
	sudo mkdir ${HOME}/data || true
	sudo mkdir ${HOME}/data/mariadb || true
	sudo mkdir ${HOME}/data/wordpress || true
	make up
ps:
	sudo docker-compose -f ${DOCKER-COMPOSE_FILE} ps
images:
	sudo docker-compose -f ${DOCKER-COMPOSE_FILE} images
ls:
	sudo docker network ls
down:
	sudo docker-compose -f ${DOCKER-COMPOSE_FILE} down
up:
	sudo docker-compose -f ${DOCKER-COMPOSE_FILE} up -d
re:
	sudo docker-compose -f ${DOCKER-COMPOSE_FILE} --build
fclean: down
	bash remove.sh
full-re: fclean all
git:
	git add .
	git commit -m "inc"
	git push
.PHONY: all down fclean re

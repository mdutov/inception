DOCKER-COMPOSE_FILE=requirements/docker-compose.yml

all:
	mkdir ${HOME}/data || true
	mkdir ${HOME}/data/mariadb || true
	mkdir ${HOME}/data/wordpress || true
	docker-compose -f ${DOCKER-COMPOSE_FILE} up -d
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
	docker-compose -f ${DOCKER-COMPOSE_FILE} --build
fclean: down
	sudo docker rm -f $(sudo docker ps -qa) || true
	sudo docker rm -f $(sudo docker ps -ls) || true
	sudo docker rmi -f $(sudo docker images -qa) || true
	sudo docker volume rm $(sudo docker volume ls -q) || true
	sudo rm -rf ${HOME}/data/mariadb || true
	sudo rm -rf ${HOME}/data/wordpress || true
	sudo rm -rf ${HOME}/data || true
	sudo docker system prune -a --force
full-re: fclean all
git:
	git add .
	git commit -m "inc"
	git push
.PHONY: all down fclean re

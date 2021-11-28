all:
	mkdir ${HOME}/data || true
	mkdir ${HOME}/data/mariadb || true
	mkdir ${HOME}/data/wordpress || true
	docker-compose -f ./srcs/docker-compose.yml up -d
ps:
	docker-compose -f ./srcs/docker-compose.yml ps
images:
	docker-compose -f ./srcs/docker-compose.yml images
down:
	docker-compose -f srcs/docker-compose.yml down
fclean: down
	sudo docker rm -f $(sudo docker ps -qa) || true
	sudo docker rm -f $(sudo docker ps -ls) || true
	sudo docker rmi -f $(sudo docker images -qa) || true
	sudo docker volume rm $(sudo docker volume ls -q) || true
	sudo rm -rf ${HOME}/data/mariadb || true
	sudo rm -rf ${HOME}/data/wordpress || true
	sudo rm -rf ${HOME}/data || true
	sudo docker system prune -a --force
re: fclean all
.PHONY: all down fclean re
	sudo docker rm -f $(sudo docker ps -qa) || true
	sudo docker rm -f $(sudo docker ps -ls) || true
	sudo docker rmi -f $(sudo docker images -qa) || true
	sudo docker volume rm $(sudo docker volume ls -q) || true
	sudo docker network rm $(sudo docker network ls -q) || true
	sudo rm -rf ${HOME}/data/mariadb || true
	sudo rm -rf ${HOME}/data/wordpress || true
	sudo rm -rf ${HOME}/data || true
	sudo docker volume prune --force
	sudo docker system prune -a --force
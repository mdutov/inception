# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tcynthia <tcynthia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/05 17:12:13 by tcynthia          #+#    #+#              #
#    Updated: 2021/12/05 17:12:16 by tcynthia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER-COMPOSE_FILE=./srcs/docker-compose.yml
HOME=/home/tcynthia

all: mkdir up

up:
	docker-compose -f ${DOCKER-COMPOSE_FILE} up -d

stop:
	docker-compose -f ${DOCKER-COMPOSE_FILE} stop

down:
	docker-compose -f ${DOCKER-COMPOSE_FILE} down

re: down
	docker-compose -f ${DOCKER-COMPOSE_FILE} up --build -d

fclean: down
	bash remove.sh

full-re: fclean all

ps:
	docker-compose -f ${DOCKER-COMPOSE_FILE} ps

docps:
	docker ps -a

images:
	docker-compose -f ${DOCKER-COMPOSE_FILE} images

docimages:
	docker images

netls:
	docker network ls

volls:
	docker volume ls

volins:
	docker volume inspect mariadb
	docker volume inspect wordpress

mkdir:
	sudo mkdir ${HOME}/data || true
	sudo mkdir ${HOME}/data/mariadb || true
	sudo mkdir ${HOME}/data/wordpress || true

git:
	git add .
	git commit -m "inc"
	git push

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tcynthia <tcynthia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/05 17:12:13 by tcynthia          #+#    #+#              #
#    Updated: 2022/02/27 18:33:53 by tcynthia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER-COMPOSE_FILE=./srcs/docker-compose.yml
HOME=/home/tcynthia

# functional part
 
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

re: down
	docker-compose -f ${DOCKER-COMPOSE_FILE} up --build -d

fclean: down
	bash remove.sh

full-re: fclean all

# informational part

info:
	bash info.sh

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

# send to github

git:
	git add .
	git commit -m "inc"
	git push

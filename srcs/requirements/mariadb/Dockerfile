FROM debian:buster

RUN apt-get update
RUN apt-get install mariadb-server -y

COPY ./tools/db.cnf /etc/mysql/db.cnf
COPY ./tools/start.sh /tmp/start.sh

EXPOSE 3306

CMD bash /tmp/start.sh
FROM debian:buster

LABEL maintainer="tcynthia"

RUN apt-get update
RUN apt-get install mariadb-server -y

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/* /tmp/

EXPOSE 3306

CMD bash /tmp/start.sh

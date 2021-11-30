FROM debian:buster

RUN apt-get update
RUN apt-get install mariadb-server -y

COPY ./new_db.sql /tmp
COPY ./db.cnf /etc/mysql/mariadb.conf.d/

RUN service mysql start && mysql < /tmp/new_db.sql
RUN rm -f /createdb.sql

EXPOSE 3306

CMD /usr/bin/mysqld_safe

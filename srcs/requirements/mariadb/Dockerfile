FROM debian:buster

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y default-mysql-server

COPY ./tools/start.sh /var/www/

RUN chmod +x /var/www/start.sh

EXPOSE 3306

ENTRYPOINT [ "/var/www/start.sh" ]

CMD [ "mysqld" ]

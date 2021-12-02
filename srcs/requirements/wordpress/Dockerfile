FROM debian:buster

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y apt-utils php-fpm php-mysql php-mbstring php-gettext
RUN apt-get install -y redis-server php-redis
RUN apt-get -y update

COPY ./tools/ /var/www/

RUN chmod +x /var/www/start.sh

EXPOSE 9000

ENTRYPOINT [ "/var/www/start.sh" ]

CMD [ "/usr/sbin/php-fpm7.3", "--nodaemonize" ]

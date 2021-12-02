FROM debian:buster

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install php7.3 php-fmp mariadb-client \
    php-mysql php-mbstring php-gettext

RUN apt-get install -y redis-server php-redis

COPY ./tools/ /var/www/

RUN chmod +x /var/www/start.sh

EXPOSE 9000

ENTRYPOINT [ "/var/www/start.sh" ]

CMD [ "/usr/sbin/php7.3", "--nodaeminise" ]

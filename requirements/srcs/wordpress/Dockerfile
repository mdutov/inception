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



# ADD https://ru.wordpress.org/wordpress-5.7.2-ru_RU.tar.gz /var/www/
# RUN cd /var/www && tar -xzvf wordpress-5.7.2-ru_RU.tar.gz
# RUN rm -f /var/www/wordpress-5.7.2-ru_RU.tar.gz
# RUN rm -f /var/www/wordpress/wp-config-sample.php
# COPY ./wp-config.php ./var/www/wordpress/

# RUN mkdir ./run/php/
# CMD ./usr/sbin/php-fpm7.3 -F

FROM debian

LABEL maintainer="tcynthia"

RUN apt update && \
  apt install -y wget php php-fpm php-mysql php-cli nano vim curl net-tools && \
  bash /etc/init.d/php7.4-fpm start && \
  wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
  mkdir /var/www/ /var/www/html && \
  tar -xvf /tmp/wordpress.tar.gz -C /var/www/html && \
  chown -R www-data:www-data /var/www/html/wordpress && \
  chmod -R 775 /var/www/html/wordpress

COPY ./tools/* /tmp/

EXPOSE 9000

CMD bash /tmp/start.sh

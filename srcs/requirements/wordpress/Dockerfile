FROM debian

LABEL maintainer="tcynthia"

RUN apt -y update
RUN apt install -y php php-fpm php-mysql\
	php-cli	net-tools curl
RUN apt -y update

RUN /etc/init.d/php7.4-fpm start

COPY ./tools/* /tmp/

EXPOSE 9000

CMD bash /tmp/start.sh

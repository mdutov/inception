FROM debian

LABEL maintainer="tcynthia"

RUN apt update
RUN apt install -y php php-fpm php-mysql php-cli \
	bash nano net-tools vim curl
RUN /etc/init.d/php7.4-fpm start

COPY ./tools/* /tmp/

EXPOSE 9000

CMD bash /tmp/start.sh

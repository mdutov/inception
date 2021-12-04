FROM debian:buster

LABEL maintainer="tcynthia"

RUN apt -y update
RUN apt install -y mariadb-server
RUN apt -y update

COPY ./tools/* /tmp/

EXPOSE 3306

CMD bash /tmp/start.sh

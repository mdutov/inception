FROM debian:buster

RUN apt-get  update
RUN apt-get -y upgrade
RUN apt-get -y install nginx
RUN apt-get -y install openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/C=RU/ST=Moscow/L=Moscow/O=inception/OU=tcynthia/CN=https:\/\/github.com\/tcynthia/emailAddress=tcynthia@21.ru"

COPY ./tools/default /etc/nginx/sites-available/default
COPY ./tools/default /etc/nginx/sites-enabled/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
FROM debian:buster

RUN apt-get  update
RUN apt-get  install nginx -y
RUN apt-get  install openssl -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/C=RU/ST=Moscow/L=Moscow/O=inception/OU=tcynthia/CN=https:\/\/github.com\/tcynthia/emailAddress=dutovm2017@yandex.ru"

COPY ./default etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]

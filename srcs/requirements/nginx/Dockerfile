FROM debian:buster

RUN apt-get  update
RUN apt-get  install nginx -y
RUN apt-get  install openssl -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/local.key \
    -out /etc/ssl/certs/local.crt \
    -subj "/C=RU/ST=Moscow/L=Moscow/O=inception/CN=tcynthias_project"

COPY ./tools/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf


CMD ["nginx", "-g", "daemon off;"]

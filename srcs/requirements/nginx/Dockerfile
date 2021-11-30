FROM debian:buster

RUN apt-get  update
RUN apt-get  install -y nginx openssl nano curl net-tools

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/local.key \
    -out /etc/ssl/certs/local.crt \
    -subj "/C=RU/ST=Moscow/L=Moscow/O=inception/CN=tcynthias_project"

COPY ./tools/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

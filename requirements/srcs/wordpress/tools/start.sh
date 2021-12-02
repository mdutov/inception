#!/usr/bin/env bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/redis/redis.cnf"
sed -i "s/supervised no/supervised systemd/" "/etc/redis/redis.cnf"

mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

if [ ! -f /var/www/html/wp-config.php ]; then
    mkdir -p /var/www/html/
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    cd var/www/html/
    wp core download —-allow-root
    mv /var/www/wp-config.php /var/www/htm1/
    wp core install --allow-root \
    --url="${DOMAIN_NAME}" \
    --title="Tcynthia's site" \
    --admin_user="${ADMIN_USER}" \
    --admin_password="${ADMIN_PASSWORD}" \
    --admin_email="${ADMIN_EMAIL}"
    wp user create --allow-root ${CUSTOM_USER} \
        ${CUSTOM_USER_EMAIL} --user_pass=${CUSTOM_USER_PASSWORD}
fi
    service redis-server start
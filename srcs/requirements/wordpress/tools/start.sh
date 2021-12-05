#!bin/env bash

if ! [ -d "/var/www/html/wordpress" ]; then
sed -i -e "s/\${DB_HOST}/${DB_HOST}/g" /tmp/wp-config.php
sed -i -e "s/\${DB_NAME}/${DB_NAME}/g" /tmp/wp-config.php
sed -i -e "s/\${DB_USER}/${DB_USER}/g" /tmp/wp-config.php
sed -i -e "s/\${DB_PASSWORD}/${DB_PASSWORD}/g" /tmp/wp-config.php
cp /tmp/wp-config.php /var/www/html/
cp /tmp/fpm.conf /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php/
touch /run/php/php7.4-fpm.pid
chown -R www-data:www-data /var/www/*
chmod -R 775 /var/www/*
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd var/www/html/
wp core download --allow-root
wp core install --allow-root --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${ADMIN_USER} --admin_password=${USERNAME} --admin_email=${ADMIN_EMAIL}
wp user create --allow-root ${CUSTOM_USER} ${CUSTOM_USER_EMAIL} --user_pass=${CUSTOM_USER_PASSWORD}
fi
rm -rf /tmp/wp-config.php /tmp/fpm.conf

/usr/sbin/php-fpm7.4 -F

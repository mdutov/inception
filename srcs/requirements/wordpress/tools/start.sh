sed -i -e "s/\${DB_HOST}/${DB_HOST}/g" /tmp/wp-config.php
sed -i -e "s/\${DB_NAME}/${DB_NAME}/g" /tmp/wp-config.php
sed -i -e "s/\${DB_USER}/${DB_USER}/g" /tmp/wp-config.php
sed -i -e "s/\${DB_PASSWORD}/${DB_PASSWORD}/g" /tmp/wp-config.php

mv /tmp/wp-config.php /var/www/html/wordpress
mv /tmp/fpm.conf /etc/php/7.4/fpm/pool.d/www.conf

chmod -R 775 /var/www/html/wordpress
chown -R www-data /var/www/html/wordpress
chgrp -R www-data /var/www/html/wordpress

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core install --allow-root --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${ADMIN_USER} --admin_password=${USERNAME} --admin_email=${ADMIN_EMAIL}
wp user create --allow-root ${CUSTOM_USER} ${CUSTOM_USER_EMAIL} --user_password=${CUSTOM_USER_PASSWORD}

# --role=author

/usr/sbin/php-fpm7.4 -F

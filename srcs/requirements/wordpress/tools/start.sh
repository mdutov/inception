sed -i -e "s/\${DB_NAME}/${DB_NAME}/g" /var/www/wordpress/wp-config.php;
sed -i -e "s/\${DB_USER}/${DB_USER}/g" /var/www/wordpress/wp-config.php;
sed -i -e "s/\${DB_PASSWORD}/${DB_PASSWORD}/g" /var/www/wordpress/wp-config.php;
sed -i -e "s/\${DB_HOST}/${DB_HOST}/g" /var/www/wordpress/wp-config.php;

chmod -R 775 /var/www/wordpress;
chown -R www-data /var/www/wordpress;
chgrp -R www-data /var/www/wordpress;

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
php wp-cli.phar --info;
chmod +x wp-cli.phar;
sudo mv wp-cli.phar /usr/local/bin/wp;
wp core install --allow-root --url=tcynthia.42.fr --title=21 --admin_user=test1 --admin_email=test1@email.com;
wp user create test1 test1@email.com --role=author --allow-root;

/usr/sbin/php-fpm7.3 -F

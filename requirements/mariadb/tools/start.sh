#!/usr/bin/env bash

sed -i "s/bind-ad/\#bind-ad/" "/etc/mysql/mariadb.conf.d/50-server.cnf"
sed -i "s/\#port /port /" "/etc/mysql/mariadb.conf.d/50-server.cnf"
chown -R mysql:mysql /var/lib/mysql
if [ ! -d /var/lib/mysql/db_inception]; then
service mysql start
mysql -u root -e "CREATE DATABASE IF NOT EXIST $DB_NAME"
mysql -u root -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' INDENTIFIED BY '$DB_USER_PASSWORD'"
mysql -u root -e "GRAND ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'wp.'$DB_NAME'_'$NETWORK''"
mysql -u root -e "FLUSH PRIVILEGES"
mysqladmin -u root password $DB_ROOT_PASSWORD
service mysql stop
else
mkdir /var/run/mysqld
touch /var/run/mysqld/mysql.pid
mkfifo /ver/run/mysqld/mysqld.sock
fi
chmod +x /var/run/mysqld
chown -R  mysql /var/run/mysqld
exec "%@"

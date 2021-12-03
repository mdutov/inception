#!/usr/bin/env bash

sed -i "s/bind-ad/\#bind-ad/" "/etc/mysql/mariadb.conf.d/50-server.cnf"
sed -i "s/\#port /port /" "/etc/mysql/mariadb.conf.d/50-server.cnf"

chown -R mysql:mysql /var/lib/mysql

if [ ! -d var/lib/mysql/mariadb ]; then
service mysql start
mysql -u root -e "SET PASSWORD FOR root@localhost = PASSWORD('$DB_ROOT_PASSWORD')"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* to 'root'@'localhost'"
mysql -u root -e "FLUSH PRIVILEGES"
mysqladmin -u root password $DB_ROOT_PASSWORD
mysql -u root -e "CREATE DATABASE IF NOT EXIST $DB_NAME"
mysql -u root -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' INDENTIFIED BY '$DB_USER_PASSWORD'"
mysql -u root -e "GRAND ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'wp.mariadb_inception' IDENTIFIED BY '$DB_USER_PASSWORD'"
mysql -u root -e "FLUSH PRIVILEGES"
service mysql stop
else
mkdir /var/run/mysqld
touch /var/run/mysqld/mysql.pid
mkfifo /var/run/mysqld/mysqld.sock
fi
chmod +x /var/run/mysqld
chown -R  mysql /var/run/mysqld
exec "$@"

# mysqld
# tail -f /dev/null;

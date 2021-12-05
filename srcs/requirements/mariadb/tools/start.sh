#!bin/env bash

cp /tmp/50-server.cnf /etc/mysql/mariadb.conf.d/

if ! [ -d "var/lib/mysql/mariadb" ]; then
service mysql start
sed -i -e "s/\${DB_NAME}/${DB_NAME}/g" /tmp/createdb.sql
sed -i -e "s/\${DB_USER}/${DB_USER}/g" /tmp/createdb.sql
sed -i -e "s/\${DB_PASSWORD}/${DB_PASSWORD}/g" /tmp/createdb.sql
sed -i -e "s/\${DB_ROOT}/${DB_HOST}/g" /tmp/createdb.sql
sed -i -e "s/\${DB_ROOT_PASSWORD}/${DB_ROOT_PASSWORD}/g" /tmp/createdb.sql
mysql < /tmp/createdb.sql
service mysql stop
fi

/usr/bin/mysqld_safe

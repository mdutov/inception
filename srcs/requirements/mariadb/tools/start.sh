cd /tmp/

sed -i -e "s/\${DB_NAME}/${DB_NAME}/g" createdb.sql
sed -i -e "s/\${DB_USER}/${DB_USER}/g" createdb.sql
sed -i -e "s/\${DB_PASSWORD}/${DB_PASSWORD}/g" createdb.sql
sed -i -e "s/\${DB_ROOT}/${DB_HOST}/g" createdb.sql
sed -i -e "s/\${DB_ROOT_PASSWORD}/${DB_HOST}/g" createdb.sql

service mysql start

cp 50-server.cnf /etc/mysql/mariadb.conf.d/
mysql < createdb.sql
rm -f createdb.sql

service mysql stop

/usr/bin/mysqld_safe

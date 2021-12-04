GRANT ALL PRIVILEGES ON *.* to 'root'@'%' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
SET PASSWORD FOR root@localhost = PASSWORD('${DB_ROOT_PASSWORD}');
FLUSH PRIVILEGES;
CREATE DATABASE ${DB_NAME} DEFAULT CHARACTER SET utf8;
CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
FLUSH PRIVILEGES;

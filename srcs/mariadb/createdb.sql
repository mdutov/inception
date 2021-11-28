CREATE DATABASE tcynthia;
CREATE USER 'tcynthia'@'%' IDENTIFIED BY 'tcynthia';
GRANT ALL PRIVILEGES ON tcynthia.* TO 'tcynthia'@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';

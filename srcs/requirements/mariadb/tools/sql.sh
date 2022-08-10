#!/bin/bash

chown -R mysql:mysql /var/lib/mysql
mysql_install_db

/usr/share/mysql/mysql.server start

mysql -u root -p"root42" <<-EOSQL
	USE mysql;
	SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root42');
	CREATE DATABASE IF NOT EXISTS wordpress;
	CREATE USER IF NOT EXISTS 'jwoo'@'%' IDENTIFIED BY 'jwoo42';
	GRANT ALL PRIVILEGES ON wordpress.* TO 'jwoo'@'%' WITH GRANT OPTION;
	FLUSH PRIVILEGES;
EOSQL

/usr/share/mysql/mysql.server status
mysqladmin --user=root --password=root42 shutdown
/usr/share/mysql/mysql.server status

exec /usr/bin/mysqld_safe --datadir='/var/lib/mysql'
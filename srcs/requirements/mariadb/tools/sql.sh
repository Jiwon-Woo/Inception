#!/bin/bash

mysql_install_db
service mysql start

mysql <<-EOSQL
	USE mysql;
	SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root42');
	CREATE DATABASE IF NOT EXISTS wordpress;
	CREATE USER IF NOT EXISTS 'jwoo'@'%' IDENTIFIED BY 'jwoo42';
	GRANT ALL PRIVILEGES ON wordpress.* TO 'jwoo'@'%' WITH GRANT OPTION;
	FLUSH PRIVILEGES;
EOSQL


killall mysqld
service mysqld stop
# chmod 755 -R /var/lib/mysql/
# chown -R mysql:mysql /var/lib/mysql/
# mysql -u root -p"root42" mysql -S /var/run/mysqld/mysqld.sock
exec mysqld_safe

# service mysqld restart
# mysqladmin -u root -p"root42"
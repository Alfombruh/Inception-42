#!/bin/bash

if [ -d	/var/lib/mysql/WordPressDB ];
then
	echo "Database is already created"
else
service mysql start
mysql -sfu root <<EOS
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
CREATE DATABASE IF NOT EXISTS WordPressDB;
CREATE OR REPLACE USER 'jofernan'@'%' IDENTIFIED BY "$MYSQL_PASSWORD";
GRANT ALL ON WordPressDB.* TO 'jofernan'@'%' IDENTIFIED BY "$MYSQL_PASSWORD"; --https://stackoverflow.com/questions/36463966/mysql-when-is-flush-privileges-in-mysql-really-needed
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD";
EOS
fi


killall mysqld #kill all the mysql daemons so if a container doesnt see clearyly which process to maintain if crashes
mysqld_safe

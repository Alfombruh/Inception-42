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
CREATE OR REPLACE USER 'jofernan'@'%' IDENTIFIED BY "$USER_PASS_MDB";
GRANT ALL ON WordPressDB.* TO 'jofernan'@'%' IDENTIFIED BY "$USER_PASS_MDB"; --https://stackoverflow.com/questions/36463966/mysql-when-is-flush-privileges-in-mysql-really-needed
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY "$ROOT_PASS_MDB";
EOS
fi


killall mysqld #kill all the mysql daemons so if a container doesnt see clearyly which process to maintain if crashes
mysqld_safe --bind-address=localhost

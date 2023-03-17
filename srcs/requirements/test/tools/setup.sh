#!/bin/bash
service mysql start
#killall mysqld
mysqld_safe --bind-address=localhost

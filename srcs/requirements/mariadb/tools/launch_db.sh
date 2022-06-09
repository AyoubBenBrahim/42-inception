#!/bin/sh

# if [ ! -f "/var/lib/mysql/ib_buffer_pool" ]; then
if [ ! -d /var/lib/mysql/$DB_NAME ]; then
service mysql start

# The wildcard as host implies that the user can connect from any client host
echo "-----------MARIA CREATE USER------------------"

echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'" | mysql -u root
echo "GRANT ALL PRIVILEGES ON * . * TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root

echo "-----------MARIA CREATE DATABASE------------------"

echo "CREATE DATABASE $DB_NAME;" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root

echo "-----------MARIA UPDATE ROOT PASSWORD USER------------------"

echo "ALTER USER 'root'@localhost IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

echo "--------------------------------"

fi 

kill `cat /var/run/mysqld/mysqld.pid`

mysqld_safe

# tail -f /dev/null
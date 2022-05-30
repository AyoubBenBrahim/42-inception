#!/bin/sh

# service mysql start
/etc/init.d/mysql start

mysql -u root -e "CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}'"
mysql -u root -e "CREATE DATABASE wordpress;"

mysql -u root -e "GRANT ALL PRIVILEGES ON * . * TO '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}'"
mysql -u root -e "FLUSH PRIVILEGES"

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'";
mysql -u root -e "FLUSH PRIVILEGES"

# mysql -u root wordpress  < /wordpress.sql
# mysql --user="root" --database="wordpress" --password="${MYSQL_ROOT_PASSWORD}" < /wordpress.sql

/etc/init.d/mysql restart


# mysql -u root -e "CREATE USER 'ayoub'@'localhost' IDENTIFIED BY '123'"
# SET PASSWORD FOR 'root'@localhost = PASSWORD("root");
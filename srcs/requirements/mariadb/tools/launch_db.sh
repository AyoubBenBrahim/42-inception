#!/bin/sh

# service mysql start
/etc/init.d/mysql start

echo "--------------------------------"

echo "CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}'" | mysql -u root
echo "GRANT ALL PRIVILEGES ON * . * TO '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}'" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root

echo "--------------------------------"

echo "CREATE DATABASE wordpress;" | mysql -u root

echo "--------------------------------"

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql -h 127.0.0.1 -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

echo "--------------------------------"

#bind-address            = 127.0.0.1
sed -i 's/127.0.0.1/0.0.0.0/' etc/mysql/mariadb.conf.d/50-server.cnf

/etc/init.d/mysql restart



# SET PASSWORD FOR 'root'@localhost = PASSWORD("root");

# SELECT user, password  FROM mysql.user WHERE User = 'root';
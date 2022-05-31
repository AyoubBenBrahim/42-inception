#!/bin/sh

# service mysql start
/etc/init.d/mysql start

echo "--------------------------------"
# The wildcard as host implies that the user can connect from any client host
echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'" | mysql -u root
echo "GRANT ALL PRIVILEGES ON * . * TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root

# SHOW GRANTS FOR ayoub@localhost;

echo "--------------------------------"

echo "CREATE DATABASE $DB_NAME;" | mysql -u root

echo "--------------------------------"

echo "ALTER USER 'root'@localhost IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root


echo "--------------------------------"

#bind-address            = 127.0.0.1
sed -i 's/127.0.0.1/0.0.0.0/' etc/mysql/mariadb.conf.d/50-server.cnf

/etc/init.d/mysql restart



# SET PASSWORD FOR 'root'@localhost = PASSWORD("root");

# SELECT user, password  FROM mysql.user WHERE User = 'root';
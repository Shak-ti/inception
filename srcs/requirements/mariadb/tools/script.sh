#!/bin/bash

service mariadb start & until mariadb-admin ping --silent; do
        sleep 1
    done

MYSQL_ROOT_PASSWORD=$(cat "$MYSQL_ROOT_PASSWORD_FILE")
MYSQL_PASSWORD=$(cat "$MYSQL_PASSWORD_FILE")

# -e = execute the statement and quit
mariadb -e -uroot -p$MYSQL_ROOT_PASSWORD "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

mariadb -e -uroot -p$MYSQL_ROOT_PASSWORD "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# create an account, set a password and grant access to the db
mariadb -e -uroot -p$MYSQL_ROOT_PASSWORD "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# update so the current instance of the db know about the recent changes
mariadb -e -uroot -p$MYSQL_ROOT_PASSWORD "FLUSH PRIVILEGES;"

mariadb-admin -uroot -p$MYSQL_ROOT_PASSWORD shutdown

# restart mariadb in safe mode 
exec mariadb_safe

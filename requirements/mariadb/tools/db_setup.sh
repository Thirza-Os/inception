#!/bin/bash

# Check if mariaDB is already configured
echo "trying to see: $SQL_DATABASE"
if [ ! -d "/var/lib/mysql/$SQL_DATABASE" ]
	then
	echo "Configuring mariadb"
    
    # initialize the MariaDB data directory.
	mysql_install_db --user=mysql --datadir=/var/lib/mysql

    # Pipe SQL commands into bootstrap: executing them as initial database setup
	{
        # flush to immediately add changes-> ensure changes are madeimmediately and are recognized immediately
		echo "FLUSH PRIVILEGES;"
		echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"
		echo "CREATE USER IF NOT EXISTS $SQL_USERNAME@'%' IDENTIFIED BY '$SQL_PASSWORD';"
		echo "GRANT ALL ON *.* TO $SQL_USERNAME@'%' IDENTIFIED BY '$SQL_PASSWORD';"
		echo "FLUSH PRIVILEGES;"
	} | mysqld --bootstrap
else
	echo "mariadb is already configured"
fi

# allowing to run additional commands or start other services in the container.
exec "$@"
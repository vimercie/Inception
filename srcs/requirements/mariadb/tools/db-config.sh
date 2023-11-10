#!/bin/bash

if [ -f /var/lib/mysql/tmp/init.sql ]; then
    exit 0
fi

service mysql start

# Vérifier si le service MySQL a démarré avec succès
if [ $? -ne 0 ]; then
    echo "Échec du démarrage du service MySQL."
    exit 1
fi

mysql -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"
echo "Created database $DB_NAME"

mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
echo "Created user $DB_USER"

mysql -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
echo "Granted privileges to $DB_USER on $DB_NAME"

mysql -e "FLUSH PRIVILEGES;"

mkdir /var/lib/mysql/tmp
touch /var/lib/mysql/tmp/init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';" > /var/lib/mysql/tmp/init.sql
echo "SHUTDOWN;" >> /var/lib/mysql/tmp/init.sql

sleep 1

service mysql stop

mysqld --init-file=/var/lib/mysql/tmp/init.sql
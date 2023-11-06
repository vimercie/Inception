#!/bin/bash

service mysql start

# Vérifier si le service MySQL a démarré avec succès
if [ $? -ne 0 ]; then
    echo "Échec du démarrage du service MySQL."
    exit 1
fi

mysql -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

service mysql stop
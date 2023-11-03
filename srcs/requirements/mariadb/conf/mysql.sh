#!/bin/bash

# Fonctions ou commandes du processus auxiliaire
function my_helper_process
{
    service mysql start
    mysql -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"
    mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
    mysql -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
    mysql -e "FLUSH PRIVILEGES;"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';"
    service mysql stop
}

# Appeler la fonction du processus auxiliaire
my_helper_process &

# Stocker le PID du processus auxiliaire
helper_pid=$!

# Vérifier que la base de données a été créée avant de continuer
while ! mysql -e "USE \`$DB_NAME\`;" 2>/dev/null; do
    echo "En attente de la création de la base de données..."
    sleep 1
done
echo "La base de données a été créée, démarrage du processus principal."

# Une fois que la base de données est prête, démarrer le processus principal
./mysqld_safe &

# Attendre la fin du processus principal
wait %1

# Assurez-vous de tuer le processus auxiliaire une fois que le script est terminé (s'il doit être terminé à ce moment-là)
kill $helper_pid

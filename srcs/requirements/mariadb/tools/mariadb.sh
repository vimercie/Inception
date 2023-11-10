#!/bin/bash

# Lancement du script de configuration de la base de données en arrière-plan
bash /tmp/db-config.sh &

# Stocker le PID du processus auxiliaire
dbconfig_pid=$!

# Attendre que le processus auxiliaire se termine
wait $dbconfig_pid

# Vérifier que le processus auxiliaire s'est terminé avec succès
if [ $? -ne 0 ]; then
    echo "Le processus auxiliaire a rencontré une erreur."
    exit 1
fi

# Démarrer le processus principal une fois le processus auxiliaire terminé
exec mysqld_safe

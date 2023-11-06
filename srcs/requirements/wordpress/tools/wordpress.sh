#!/bin/bash

# Lancement du script de configuration de WordPress en arrière-plan
bash /tmp/wp-config.sh &

# Stocker le PID du processus auxiliaire
wpconfig_pid=$!

# Attendre que le processus auxiliaire se termine
wait $wpconfig_pid

# Vérifier que le processus auxiliaire s'est terminé avec succès
if [ $? -ne 0 ]; then
    echo "Le processus auxiliaire a rencontré une erreur."
    exit 1
fi

# -F : Faire tourner php-fpm en avant-plan, utile pour Docker
exec /usr/sbin/php-fpm7.3 -F

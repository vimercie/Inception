#!/bin/bash

# Lancement du processus auxiliaire depuis le script /tmp/auto-config.sh
bash /tmp/auto-config.sh &

# Stockage du PID du processus auxiliaire
helper_pid=$!

# Une fois que la base de données est prête, démarrer le processus principal (exemple : PHP-FPM)
/usr/sbin/php-fpm7.3 -F &

# Attendre la fin du processus principal
wait

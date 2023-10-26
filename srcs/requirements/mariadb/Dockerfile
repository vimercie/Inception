FROM	 debian:buster

# Installation des dépendances
RUN		apt update -y &&    \
		apt upgrade -y &&   \
		apt install -y mariadb-server=1:10.3.39-0+deb10u1

# Permission de l'utilisateur mysql sur le dossier de stockage des données
RUN		chown -R mysql:mysql /var/lib/mysql
RUN		chmod +x -R /var/lib/mysql

# Variables d'environnement
ARG		HOSTNAME=${HOSTNAME}
ARG		SQL_HOST=${SQL_HOST}
ARG 	SQL_DATABASE=${SQL_DATABASE}
ARG 	SQL_USER=${SQL_USER}
ARG 	SQL_PASSWORD=${SQL_PASSWORD}
ARG 	SQL_ROOT_PASSWORD=${SQL_ROOT_PASSWORD}

# Execution du script de configuration de MySQL
COPY	conf/mysql.sh /tmp/mysql.sh
RUN		chmod +x /tmp/mysql.sh
RUN		/tmp/mysql.sh

# Exposer le port MySQL (par défaut, 3306)
EXPOSE	3306

# Commande de démarrage
CMD 	["mysqld"]

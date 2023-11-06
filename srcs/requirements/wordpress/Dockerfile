FROM	 debian:buster

# Installation des dépendances
RUN		apt update -y &&		\
		apt upgrade -y &&		\
		apt install -y wget		\
		php7.3					\
		php7.3-fpm				\
		php7.3-mysql			\
		mariadb-client

# Téléchargement et décompression de WordPress dans le dossier /var/www
RUN		wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www	\
		&& cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz					\
		&& rm wordpress-6.0-fr_FR.tar.gz										\
		&& chown -R root:root /var/www/wordpress

# Installation de WP-CLI
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		mv wp-cli.phar /usr/local/bin/wp && \
		chmod +x /usr/local/bin/wp

# Configuration de PHP
COPY 	conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Copie des scripts de configuration et de lancement de WordPress
COPY 	tools/wordpress.sh /tmp/wordpress.sh
COPY	tools/wp-config.sh /tmp/wp-config.sh
RUN		chmod -R +x /tmp

# Création du dossier de stockage des processus de PHP
RUN		mkdir -p /run/php

ENTRYPOINT ["/tmp/wordpress.sh"]

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

# Variables d'environnement
ARG 	SQL_DATABASE=${SQL_DATABASE}
ARG 	SQL_USER=${SQL_USER}
ARG 	SQL_PASSWORD=${SQL_PASSWORD}

# Configuration de WordPress
COPY	conf/wp-config.php /tmp/wp-config.php
RUN		chmod -R +x /var/www/wordpress
RUN 	mv /tmp/wp-config.php /var/www/wordpress/wp-config.php

# Configuration de PHP
COPY 	conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Exposition des ports
EXPOSE	9000

RUN		mkdir -p /run/php

CMD		["/usr/sbin/php-fpm7.3", "-F"]
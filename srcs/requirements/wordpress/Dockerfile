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

# Configuration de PHP
COPY 	conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Configuration de Wordpress
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		mv wp-cli.phar /usr/local/bin/wp && \
		chmod +x /usr/local/bin/wp

COPY	conf/auto-config.sh /tmp/auto-config.sh
COPY 	conf/wordpress.sh /tmp/wordpress.sh
RUN		chmod -R +x /tmp

RUN		mkdir -p /run/php

ENTRYPOINT /tmp/wordpress.sh

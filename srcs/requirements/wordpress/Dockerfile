FROM debian:buster

# Installation des dépendances
RUN		apt update -y &&		\
		apt upgrade -y &&		\
		apt install -y wget		\
		php7.3					\
		php7.3-fpm				\
		php7.3-mysql			\
		mariadb-client

# Téléchargement et décompression de WordPress dans le dossier /var/www
RUN		wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www						\
		&& cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz		\
		&& chown -R root:root /var/www/wordpress

RUN		echo "listen=9000" >> /etc/php/7.3/cli/php.ini		\
		&& echo "clear_env=no" >> /etc/php/7.3/cli/php.ini

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /var/www/wordpress	\
		&& chmod +x /var/www/wordpress/wp-cli.phar																\
		&& mv /var/www/wordpress/wp-cli.phar /usr/local/bin/wp

# Copie des scripts d'initialisation
COPY	./conf/init.sh /var/www/wordpress/init.sh

# Ajout des droits d'exécution sur le script d'initialisation
RUN		chmod +x /var/www/wordpress/init.sh

# Exposition des ports
EXPOSE	9000

RUN		mkdir -p /run/php

RUN		/usr/sbin/php-fpm7.3 -F

# Lancement du script d'initialisation
CMD		["bash", "/var/www/wordpress/init.sh"]

# Commande pour lancer le container
# docker run -it --rm -p 9000:9000 --name wordpress wordpress

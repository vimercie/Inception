FROM	 debian:buster

# Installation des dépendances
RUN		apt update -y &&    \
		apt upgrade -y &&   \
		apt install -y gettext && \
		apt install -y mariadb-server=1:10.3.39-0+deb10u1

# Configuration de MariaDB
COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Copie du script de configuration et de lancement de MariaDB
COPY	tools/mariadb.sh /tmp/mariadb.sh
COPY	tools/db-config.sh /tmp/db-config.sh
RUN		chmod +x /tmp/mariadb.sh

ENTRYPOINT	["/tmp/mariadb.sh"]
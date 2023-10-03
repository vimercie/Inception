FROM debian:buster

# Installation des dépendances
RUN		apt update -y &&									\
		apt upgrade -y &&									\
		apt install -y mariadb-server=1:10.3.39-0+deb10u1

# Copie de la configuration de MariaDB
COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# Création de la base de données MySQL à l'aide du système de table
RUN		service mysql start &&																									\
		mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" &&														\
		mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" &&					\
		mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" &&		\
		mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" &&										\
		mysql -e "FLUSH PRIVILEGES;" &&																							\
		mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown &&																		\
		exec mysqld_safe
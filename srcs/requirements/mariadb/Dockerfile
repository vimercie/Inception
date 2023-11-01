FROM	 debian:buster

# Installation des dépendances
RUN		apt update -y &&    \
		apt upgrade -y &&   \
		apt install -y gettext && \
		apt install -y mariadb-server=1:10.3.39-0+deb10u1

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# COPY	conf/mysql.sh /tmp/mysql.sh
# RUN		chmod +x /tmp/mysql.sh

EXPOSE	3306

CMD		["mysqld_safe"]
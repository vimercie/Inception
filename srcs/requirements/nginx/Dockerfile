FROM	debian:buster

# Installation des dépendances
RUN		apt update -y &&							\
		apt upgrade -y &&							\
		apt install -y nginx=1.14.2-2+deb10u5 &&	\
		apt install -y openssl=1.1.1n-0+deb10u6

# Création et auto-signature du certificat SSL/TLS
RUN		mkdir -p /etc/nginx/ssl &&					\
		openssl req -x509 -nodes 					\
		-out	/etc/nginx/ssl/inception.crt		\
		-keyout	/etc/nginx/ssl/inception.key		\
		-subj "/C=FR/ST=ARA/L=Lyon/O=42Lyon/OU=Student/CN=vimercie.42lyon.fr/UID=vimercie"

#		req:		Requête de certificat,
#		-x509:		Auto-signature du certificat,
#		-nodes:		Ne pas mettre de mot de passe,
#		-out:		Chemin du certificat,
#		-keyout:	Chemin de la clé privée,
#		-subj:		Informations du certificat.

# Création du dossier de stockage des processus de Nginx
RUN		mkdir -p /var/run/nginx

# Copie de la configuration de Nginx
COPY	conf/nginx.conf /etc/nginx/nginx.conf

# Gestion des droits
# RUN		chmod 755 /var/www/html
# RUN		chown -R www-data:www-data /var/www/html

# Lancement de Nginx
CMD 	[ "nginx", "-g", "daemon off;" ]

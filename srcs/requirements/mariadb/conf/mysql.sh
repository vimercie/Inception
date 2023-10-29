#Check if database is already created (in case of crash or pause, don't recreate it)
if [ ! -d "/var/lib/mysql/${SQL_DATABASE}" ]
then
	#Create socket for mysql (to run sql)
	service mysql start
	#sleep to make sure socket has been created
	sleep 3
	#mysql -e = run command without open mysql (like a subshell)
	#Create database
	mysql -e "CREATE DATABASE ${SQL_DATABASE}" && \
	#Create a new user (the percent is use to be able to connect from anywhere)
	mysql -e "CREATE USER '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';" && \
	#Get him all privileges
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}' WITH GRANT OPTION;" && \
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}' WITH GRANT OPTION;" && \
	#Make sure grants take effect right now
	mysql -e "FLUSH PRIVILEGES;"
	#Make the root password take effect's
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}'"
	#Change root password
	sed -i "s/password =/password = ${SQL_ROOT_PASSWORD} #/" /etc/mysql/debian.cnf
	#stop mysql to be able to launch mysqld_safe
	service mysql stop
fi

#start mysql server in safe mode (will restart if crash) and send data to path
mysqld_safe --datadir=/var/lib/mysql
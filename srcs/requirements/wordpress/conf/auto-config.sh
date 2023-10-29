sleep 10
wp config create	--allow-root \
			        --dbname=$SQL_DATABASE \
			        --dbuser=$SQL_USER \
			        --dbpass=$SQL_PASSWORD \
			        --dbhost=mariadb:3306 --path='/var/www/wordpress'RUN		wp core config --allow-root --path=/var/www/wordpress --dbname=wordpress --dbuser=mysql --dbpass=password --dbhost=mysql --dbprefix=wp_
wp core install
wp user create --allow-root --path=/var/www/wordpress admin
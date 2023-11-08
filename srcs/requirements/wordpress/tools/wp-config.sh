sleep 10
cd /var/www/wordpress

if [ -f /var/www/wordpress/wp-config.php ]; then
	exit 0
fi

wp config create	--allow-root \
			        --dbname=$DB_NAME \
			        --dbuser=$DB_USER \
			        --dbpass=$DB_PASSWORD \
			        --dbhost=$DB_HOST \
					--path='/var/www/wordpress'
wp core install 	--allow-root \
					--path=/var/www/wordpress \
					--url=https://vimercie.42.fr \
					--title="Vimercie's site" \
					--admin_user=$DB_USER \
					--admin_password=$DB_PASSWORD \
					--admin_email=vincent.mrc@hotmail.com
wp user create 		--allow-root \
					--path=/var/www/wordpress \
					user1 vimercie@student.42lyon.fr \
					--user_pass=$DB_PASSWORD
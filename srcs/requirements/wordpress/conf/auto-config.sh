sleep 10
cd /var/www/wordpress
wp config create	--allow-root \
			        --dbname=$DB_NAME \
			        --dbuser=$DB_USER \
			        --dbpass=$DB_PASSWORD \
			        --dbhost=$DB_HOST \
					--path='/var/www/wordpress'
wp core install 	--allow-root \
					--path=/var/www/wordpress \
					--url=https://localhost \
					--title="Vimercie's site" \
					--admin_user=admin \
					--admin_password=admin \
					--admin_email=vincent.mrc@hotmail.com
wp user create 		--allow-root \
					--path=/var/www/wordpress \
					vimercie vimercie@student.42lyon.fr	\
					--user_pass=password
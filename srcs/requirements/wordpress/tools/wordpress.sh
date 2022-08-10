#!/bin/bash

/etc/init.d/php7.3-fpm start
/etc/init.d/php7.3-fpm status

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

if [ ! -e /var/www/html/wp-config.php ]; then
	wp core download --allow-root --locale=ko_KR --version=5.8.1 --path=/var/www/html
	wp config create --allow-root --dbname=wordpress --dbuser=jwoo --dbpass=jwoo42 --dbhost=mariadb:3306 --path=/var/www/html
	wp core install --allow-root --path=/var/www/html --url=https://jwoo.42.fr --title=Inception --admin_user=jwoo --admin_password=jwoo42 --admin_email=jwoo@student.42seoul.kr
	wp user create --allow-root jiwon jiwon970607@gmail.com --user_pass=jiwon42 --role=author --path=/var/www/html
fi

/etc/init.d/php7.3-fpm stop

exec /usr/sbin/php-fpm7.3 -F
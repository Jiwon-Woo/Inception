#!/bin/bash

/etc/init.d/php7.3-fpm start
/etc/init.d/php7.3-fpm status

# RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# RUN 	chmod +x /tmp/wordpress.sh \
# 		&& chmod +x wp-cli.phar \
# 		&& mv wp-cli.phar /usr/local/bin/wp \
# 		&& wp core download --version=5.8.1 --path=/var/www/wordpress

/etc/init.d/php7.3-fpm stop

exec /usr/sbin/php-fpm7.3 -F
FROM 	debian:buster

RUN		apt-get update && apt-get -y upgrade \
		&& apt-get -y install mariadb-client vim wget curl sudo\
			php7.3 php-fpm php-cli php-mysql php-mbstring php-mysqli php-xml sendmail

COPY	./conf/wp-config.php /var/www/html/wp-config.php
COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY	./tools/wordpress.sh /tmp/wordpress.sh

RUN 	wget https://wordpress.org/latest.tar.gz \
		&& tar -xvf latest.tar.gz \
		&& cp -r /wordpress/* /var/www/html/ \
		&& chown -R www-data:www-data /var/www/html/ \
		&& rm -r /wordpress latest.tar.gz /var/www/html/wp-config-sample.php

# RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# RUN 	chmod +x /tmp/wordpress.sh \
# 		&& chmod +x wp-cli.phar \
# 		&& mv wp-cli.phar /usr/local/bin/wp \
# 		&& wp core download --version=5.8.1 --path=/var/www/wordpress

# ENTRYPOINT ["/usr/sbin/php-fpm7.3", "-F"]
CMD 	["bash", "/tmp/wordpress.sh"]
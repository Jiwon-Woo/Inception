FROM 	debian:buster

RUN		apt-get update && apt-get -y upgrade \
		&& apt-get -y install mariadb-client vim wget curl sudo\
			php7.3 php-fpm php-cli php-mysql php-mbstring php-mysqli php-xml sendmail

COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY	./tools/wordpress.sh /tmp/wordpress.sh

ENTRYPOINT	["bash", "/tmp/wordpress.sh"]
FROM 	debian:buster

RUN		apt-get update && apt-get -y upgrade \
		&& apt-get -y install mariadb-server vim \
		&& chmod 755 -R /var/lib/mysql/ \
		&& chown -R mysql:mysql /var/lib/mysql/

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY	./conf/my.cnf /etc/mysql/my.cnf
COPY	./tools/sql.sh /tmp/sql.sh

# RUN		service mysql start

CMD 	["bash", "/tmp/sql.sh"]
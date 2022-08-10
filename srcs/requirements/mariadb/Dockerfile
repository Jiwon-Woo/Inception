FROM 	debian:buster

RUN		apt-get update && apt-get -y upgrade \
		&& apt-get -y install mariadb-server vim procps

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	./tools/sql.sh /tmp/sql.sh

RUN		chmod +x /tmp/sql.sh

ENTRYPOINT	["/tmp/sql.sh"]
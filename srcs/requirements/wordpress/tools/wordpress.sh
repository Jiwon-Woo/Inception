#!/bin/bash

cat << EOF > exit.sql
exit
EOF

while ! mysql -hmariadb -P3306 -ujwoo -pjwoo42 < exit.sql ; do
	if [ $status -ge 30 ]; then
		printf "FAILED connect to db\n"
		exit 1
	fi
	printf "Trying to connect to db ($status/30)\n"
	status=$((status+1))
	sleep 1
done
echo -e "Success."

/etc/init.d/php7.3-fpm start
/etc/init.d/php7.3-fpm status
/etc/init.d/php7.3-fpm stop
/usr/sbin/php-fpm7.3 -F
FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y

COPY conf/mariadb.conf /etc/mysql/my.cnf
COPY tools/mariadb.sh /usr/local/bin/mariadb.sh

RUN mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 777 /var/run/mysqld /usr/local/bin/mariadb.sh && \
	rm -rf ./wp-config.php && \
	mysql_install_db

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]





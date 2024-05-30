#! /bin/bash

/usr/sbin/mysqld &


echo "waiting MariaDB init..."

sleep 5

#condicion que comprueba si la base de datos ya existe

if [ ! -d /var/lib/mysql/${DB_NAME} ];
then
	mysql --user=$DB_ROOT_USER --password=$DB_ROOT_PASS -e "CREATE DATABASE $DB_NAME;"
	mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
	mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' WITH GRANT OPTION;"
	mysql -e "FLUSH PRIVILEGES;"
	mysql -e "ALTER USER '${DB_ROOT_USER}'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';"
fi

#Apaga el servidor MyDQL que hemos iniciado en segundo plano al inicio.

mysqladmin -u ${DB_ROOT_USER} --password=${DB_ROOT_PASS} shutdown

#espera a que el proceso se apague y lo reiniciamos enlazando con todas las ip.

mysqld --bind-address=0.0.0.0

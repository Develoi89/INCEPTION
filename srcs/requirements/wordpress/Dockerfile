FROM debian:bullseye

#Instala PHP, otras dependencias necesarias y el cliente de mariaDb
RUN apt-get update -y && apt-get -y install \
	curl \
    	php-fpm \
    	php-mysqli \
    	mariadb-client && \
#Descarga wp-cli.phar, un archivo PHP que contiene el cliente de linea de comandos de worpress
#le da permisos de ejecucion y lo aloja en el Path, para que los comandos puedan ejecutarse 
#en el terminal desde cualquier directorio del entorno.
    	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    	chmod +x wp-cli.phar && \
    	mv wp-cli.phar /usr/local/bin/wp 
    
COPY 	conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY 	./tools/wordpress_up.sh /usr/local/bin/wordpress_up.sh

RUN mkdir -p /run/php && \
	chmod 777 /run/php /usr/local/bin/wordpress_up.sh

EXPOSE 9000

WORKDIR /var/www/html/

ENTRYPOINT ["/usr/local/bin/wordpress_up.sh"]

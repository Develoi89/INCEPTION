FROM debian:bullseye

#Instala PHP, otras dependencias necesarias y el cliente de mariaDb
RUN apt update -y && apt -y install \
    php-fpm \
    php-mysql \
    mariadb-client \
    curl

#Descarga wp-cli.phar, un archivo PHP que contiene el cliente de linea de comandos de worpress
#le da permisos de ejecucion y lo aloja en el Path, para que los comandos puedan ejecutarse 
#en el terminal desde cualquier directorio del entorno.
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp 
    
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

EXPOSE 9000

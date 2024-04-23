FROM debian:bullseye

RUN apt update && \
    apt install -y nginx && \
    apt install -y openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx-selfsigned.key \
    -out /etc/nginx/ssl/nginx-selfsigned.crt \
    -subj "/C=ES/ST=Catalunya/L=Barcelona/O=42 barcelona/CN=ealonso-"

COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"] 

FROM debian:bullseye

RUN apt update && \
    apt install -y nginx

COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"] 

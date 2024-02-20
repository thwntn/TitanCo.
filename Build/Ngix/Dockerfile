FROM  nginx:1.25.3

COPY Build/Ngix/html /var/www/nginx/
COPY Build/Ngix/default.conf /etc/nginx/conf.d

RUN chmod 777 -R /var/www/nginx/
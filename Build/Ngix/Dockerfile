FROM  nginx:1.25.3

COPY Ngix/html /var/www/nginx/
COPY Ngix/default.conf /etc/nginx/conf.d

RUN chmod 777 -R /var/www/nginx/
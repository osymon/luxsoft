FROM nginx:latest
RUN apt-get update -y
RUN apt-get install -y php php-fpm php7.4-curl php-curl
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir /run/php/
COPY ./html/default.conf /etc/nginx/conf.d/
COPY ./html/index.php /usr/share/nginx/html/
CMD chown nginx. /usr/share/nginx/html/index.php
CMD /usr/sbin/php-fpm7.4 -D ; chown nginx. /run/php/ -R ; nginx
EXPOSE 80

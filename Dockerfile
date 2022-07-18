From ubuntu
RUN apt update && apt install nginx -y
EXPOSE 80/tcp

RUN mkdir -p /var/www/nginxconf
RUN mkdir -p /var/www/nginx

COPY index_nginx.html /var/www/nginx
COPY index_conf.html /var/www/nginxconf/
RUN chown -R www-data:www-data /var/www/
#COPY conf/nginx.conf /etc/nginx/
COPY sites-available/ /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/nginx.docker.digital /etc/nginx/sites-enabled/
RUN ln -s /etc/nginx/sites-available/nginxconf.docker.digital /etc/nginx/sites-enabled/

CMD ["nginx", "-g", "daemon off;"]


# FROM nginx:alpine
# COPY ./nginx.conf /etc/nginx/nginx.conf
# WORKDIR /usr/share/nginx/html 
# COPY . .

# FROM php:7.3-apache
# #Install git
# RUN apt-get update \
#     &amp;&amp; apt-get install -y git
# RUN docker-php-ext-install pdo pdo_mysql mysqli
# RUN a2enmod rewrite
# #Install Composer
# RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# RUN php composer-setup.php --install-dir=. --filename=composer
# RUN mv composer /usr/local/bin/
# COPY src/ /var/www/html/
# EXPOSE 80


# FROM php:7.3
FROM php:7.2-apache-stretch
#install mysqli and enable
RUN docker-php-ext-install mysqli
RUN docker-php-ext-enable mysqli
COPY . /var/www/html/
EXPOSE 80
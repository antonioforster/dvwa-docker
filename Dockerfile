FROM arm64v8/php:8.2-apache

RUN apt-get update && \
    apt-get install -y git zip unzip libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libzip-dev iputils-ping && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd mysqli pdo pdo_mysql && \
    a2enmod rewrite

COPY . /var/www/html
RUN chown -R www-data:www-data /var/www/html


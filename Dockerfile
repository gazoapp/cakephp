FROM php:5.6-apache

COPY config/application.conf /etc/apache2/conf-enabled/application.conf

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y libmcrypt-dev g++ libicu-dev libmcrypt4 libicu52
RUN docker-php-ext-install pdo_mysql intl mbstring mcrypt

RUN rm -rf /data/www/webroot && mkdir -p /data/www/webroot && chown -R www-data:www-data /data/www/webroot
RUN rm -rf /data/www/tmp && mkdir -p /data/www/tmp && chown -R www-data:www-data /data/www/tmp
RUN rm -rf /data/www/logs && mkdir -p /data/www/logs && chown -R www-data:www-data /data/www/logs

VOLUME /data

EXPOSE 80

CMD ["apache2-foreground"]

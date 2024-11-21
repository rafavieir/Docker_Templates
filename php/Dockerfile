FROM php:8.1-apache
RUN a2enmod rewrite
COPY ./app_php/ /var/www/html/
RUN ln -sfT /dev/stderr /var/log/apache2/error.log \
    && ln -sfT /dev/stdout /var/log/apache2/access.log
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html
EXPOSE 80
CMD ["apache2-foreground"]

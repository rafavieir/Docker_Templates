# Use a imagem oficial do PHP com Apache
FROM php:8.1-apache

# Habilite o módulo de reescrita do Apache (caso necessário)
RUN a2enmod rewrite

# Copie os arquivos do diretório x para o diretório padrão do Apache
COPY ./app_php/ /var/www/html/

# Conceda permissões ao diretório onde os arquivos serão armazenados
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Exponha a porta 80
EXPOSE 80

# Comando para iniciar o Apache no container
CMD ["apache2-foreground"]

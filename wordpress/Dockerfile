# Usando a imagem oficial do WordPress com PHP e Apache
FROM wordpress:php8.1-apache

# Instalando pacotes extras, se necessário
RUN apt-get update && apt-get install -y \
    vim less curl && \
    rm -rf /var/lib/apt/lists/*

# Porta padrão para o Apache/WordPress
EXPOSE 80

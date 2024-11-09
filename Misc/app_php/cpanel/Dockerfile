# Usar a imagem base do Rocky Linux
FROM rockylinux/rocky:8

# Atualizar o sistema e instalar pacotes necessários
RUN yum -y update && \
    yum -y install perl curl && \
    yum -y clean all

# Criar o diretório de armazenamento
RUN mkdir -p /myapp

# Expor portas se necessário (ajuste conforme sua aplicação)
EXPOSE 80 

# Definir o diretório de trabalho
WORKDIR /myapp

# Comando padrão para manter o container ativo
CMD ["tail", "-f", "/dev/null"]

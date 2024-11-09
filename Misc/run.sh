
##automatizar build e run de containers em docker, com hotreload.

#!/bin/bash

# Nome da imagem e container
IMAGE_NAME="appphp"
CONTAINER_NAME="meu-apache-container"
HOST_PORT=8000
CONTAINER_PORT=80

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

APP_DIR="$SCRIPT_DIR/app_php"

error_exit() {
    echo "$1" 1>&2
    exit 1
}

echo "Construindo a imagem Docker..."
sudo docker build -t $IMAGE_NAME . || error_exit "Erro ao construir a imagem Docker."

if [ "$(sudo docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Parando o container existente..."
    sudo docker stop $CONTAINER_NAME || error_exit "Erro ao parar o container existente."
fi

if [ "$(sudo docker ps -a -q -f name=$CONTAINER_NAME)" ]; then
    echo "Removendo o container existente..."
    sudo docker rm $CONTAINER_NAME || error_exit "Erro ao remover o container existente."
fi

echo "Executando o container com hot reload..."
sudo docker run -d -p $HOST_PORT:$CONTAINER_PORT -v $APP_DIR:/var/www/html --name $CONTAINER_NAME $IMAGE_NAME || error_exit "Erro ao executar o container."

if [ "$(sudo docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Servidor no ar com hot reload! Acesse http://localhost:$HOST_PORT/ para ver sua aplicação PHP."
else
    error_exit "O container não está em execução. Verifique os logs para mais detalhes."
fi

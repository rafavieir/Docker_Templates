#!/bin/bash

# Variáveis
COMPOSE_FILE="docker-compose.yml"

# Parar e remover contêineres antigos, se existirem
echo "Parando contêineres existentes..."
docker-compose -f $COMPOSE_FILE down

# Construir imagens e subir os contêineres
echo "Construindo e iniciando os serviços..."
docker-compose -f $COMPOSE_FILE up --build -d

# Exibir logs para monitorar o status
echo "Acompanhe os logs com: docker-compose logs -f"

#!/bin/bash

COMPOSE_FILE="docker-compose.yml"
echo "matando contêineres existentes..."
docker-compose -f $COMPOSE_FILE down

echo "Construindo e iniciando os serviços..."
docker-compose -f $COMPOSE_FILE up --build -d

echo "Acompanhe os logs com: docker-compose logs -f"

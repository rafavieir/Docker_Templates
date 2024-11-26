#!/bin/bash

# Verifica se o Docker está rodando
if ! docker info >/dev/null 2>&1; then
  echo "Docker não está em execução. Por favor, inicie o Docker e tente novamente."
  exit 1
fi

echo "Iniciando containers Docker..."

# Desliga os containers existentes
docker-compose down

# Reconstrua as imagens sem cache (caso haja alterações)
docker-compose build --no-cache

# Subir os containers em segundo plano (detached mode)
docker-compose up -d

echo "Containers iniciados com sucesso!"

# Aguardar o Node.js e o MySQL estarem prontos
echo "Aguardando a aplicação Node.js e o MySQL estarem prontos..."

# Dá um tempo para o banco de dados MySQL iniciar
sleep 10

# Exibir os logs do container Node.js para monitorar a execução
docker-compose logs -f node-app

# Opção para acessar o terminal do container Node.js
echo "Deseja acessar o ambiente do container Node.js? (s/n)"
read -r resposta

if [ "$resposta" == "s" ]; then
  echo "Acessando o terminal do container Node.js..."
  docker exec -it node-mysql_node-app_1 /bin/bash
fi

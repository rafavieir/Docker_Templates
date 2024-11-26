# Usa a imagem oficial do Node.js como base
FROM node:18
RUN apt-get update && apt-get install -y \
  chromium \
  && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho
WORKDIR /usr/src/app

# Copia os arquivos package.json e package-lock.json
COPY package*.json ./

# Instala as dependências
RUN npm install
RUN npm install -g nodemon


# Copia todos os arquivos, incluindo a pasta src/
COPY . .

# Expõe a porta 3000
EXPOSE 3000

# Define o comando de inicialização
CMD ["node", "src/server.js"]

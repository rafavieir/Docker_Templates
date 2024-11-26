// server.js

const express = require('express');
const path = require('path');
const app = express();

app.get('/', (req, res) => {
  console.log('Acessando a rota raiz');
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.listen(3000, () => {
  console.log('Servidor iniciado na porta 3000');
});

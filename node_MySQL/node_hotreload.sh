if [ "$1" == "enable" ]; then
  echo "Habilitando hot reload..."
  sed -i 's/"start": "node server.js"/"start": "nodemon server.js"/' package.json
  docker-compose up --build
elif [ "$1" == "disable" ]; then
  echo "Desabilitando hot reload..."
  sed -i 's/"start": "nodemon server.js"/"start": "node server.js"/' package.json
  docker-compose up --build
else
  echo "Uso: ./toggle_hot_reload.sh [enable|disable]"
fi

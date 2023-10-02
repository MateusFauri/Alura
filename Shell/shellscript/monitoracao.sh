#!/bin/bash

# Podemos usar o crontab para rodar automaticamente de tempo em tempo!
# # No arch isso é feito pelo cron 

resposta=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)
echo $resposta
if [ $resposta -eq 200 ]; then
	echo "Servidor esta rodando corretamente"
else
	echo "Houve um erro no servidor. Tentando reiniciar"
	systemctl restart apache
	echo "Servidor reiniciado!"
fi


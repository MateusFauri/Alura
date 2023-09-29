#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2 }')
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')
memoria_consumida_gb=$(free -h | grep -i mem | awk '{ print $3 }')
porcentagem=$(bc <<<"scale=2;$memoria_consumida/$memoria_total * 100" | awk -F. '{ print $1 }') 

if [ $porcentagem -gt 50 ]; then
	echo "Consumo de memoria acima do limite!"
fi

echo "Memoria consumida é igual a $porcentagem %, sendo ela de $memoria_consumida_gb "


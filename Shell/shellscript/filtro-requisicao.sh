#!/bin/bash
 
DIR=~/Documentos/alura/apache-log

if [ -z $1 ]; then
	while [ -z $verbo ]; do
		read -p "Voce esqueceu de colocar o verbo (GET, PUT, POST, DELETE): " verbo
		verbo_maisculo=$(echo $verbo | awk '{ print toupper($1) }')
	done
else
	verbo_maisculo=$(echo $1 | awk '{ print toupper($1) }')
fi

case $verbo_maisculo in
	GET) cat $DIR/apache.log | grep GET ;;
	POST)  cat $DIR/apache.log | grep POST ;;
	DELETE) cat $DIR/apache.log | grep DELETE ;; 
	PUT) cat $DIR/apache.log | grep PUT ;; 
	*) echo "Parametro Invalido!" ;;
esac

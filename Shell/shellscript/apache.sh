#!/bin/bash

DIR=~/Documentos/alura/apache-log

regex="^([0-9]{1,3}\.){3}[0-9]{1,3}$"

if [[ $1 =~ $regex ]]; then
	#cat ~/Documentos/alura/apache-log/apache.log | grep $1
	cat $DIR/apache.log | grep $1
	if [ $? -ne 0 ]; then
		echo "O endereço IP procurado não está presente no arquivo!"
	fi
else
	cat "Formato não é valido"
fi









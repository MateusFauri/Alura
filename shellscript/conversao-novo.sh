#!/bin/bash

DIR=~/Documentos/alura/imagens-novos-livros

converter(){
	local arquivo_sem_extensao=$(ls $1 | awk -F. '{ print $1 }')
	convert $arquivo_sem_extensao.jpg $arquivo_sem_extensao.png
}

varredura(){
	cd $1
	for arquivo in *; do
		local caminho_arquivo=$(find $DIR -name $arquivo) 
		if [ -d $caminho_arquivo ]; then
			varredura $caminho_arquivo			
		else
			converter $caminho_arquivo
		fi
	done
}

varredura $DIR

if [ $? -eq 0 ]; then
	echo "Conversao realizada com sucesso!"
else
	echo "Houve um erro na conversao!"
fi

#!/bin/bash

CONVERTIDOS=~/Documentos/alura/imagens-livros/imagens-convertidas 
IMAGENS=~/Documentos/alura/imagens-livros

converte_imagem(){
if [ -d "$IMAGENS" ]; then
	if [ ! -d "$CONVERTIDOS" ]; then
		echo "Creating the directory..."
		mkdir $CONVERTIDOS
	fi
  	
	cd $IMAGENS

	for imagem in *.jpg; do
		local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
		convert $imagem $CONVERTIDOS/$imagem_sem_extensao.png
	done

	cd ~
fi
}

converte_imagem 2>$IMAGENS/error_conversao.txt #descritor 2 é o fluxo padrão de mensagem de erro! 
if [ $? -eq 0 ]; then
	echo "Done!"
else
	echo "Error!"
fi


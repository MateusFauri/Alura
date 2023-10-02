#!/bin/bash

BYTES=1024
processos=$(ps -e -o pid --sort -size | head -n 11 | grep '[0-9]')
DIR=~/Documentos/alura/log

if [ ! -d $DIR ]; then
	mkdir $DIR
fi

processos() {
for pid in $processos; do
	nome=$(ps -p $pid -o comm=)
	data=$(date +%F,%H:%M:%S)
	memoria=$(ps -p $pid -o size | grep '[0-9]')
	memoria_mb=$(bc <<< "scale=2;$memoria/$BYTES")
	#echo -n $data >> $nome.log
	#echo $memoria_mb >> $nome.log
	echo "$data,$memoria_mb MB" >> $DIR/"$nome.log"
done
}

processos
if [ $? -eq 0 ]; then
	echo "Os arquivos foram salvos com sucesso"
else
	echo "Houve um problema na hora de salvar os arquivos!"
fi


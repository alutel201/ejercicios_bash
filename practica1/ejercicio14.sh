#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: scipt directorio"
    exit 1
fi

directorio=$1
if [ ! -d "$directorio" ]; then
    echo "Error: El directorio '$directorio' no existe."
    exit 1
fi
contador=0
echo "Listado de entradas en el directorio '$directorio':"
for entrada in "$directorio"/*; do
    nombre=$(basename "$entrada")
    if [ -f "$entrada" ]; then
        echo "$nombre es un fichero."
        ((contador++))
    elif [ -d "$entrada" ]; then
        echo "$nombre es un directorio."
        ((contador++))
    fi
done

echo "numero total de entradas : $contador"

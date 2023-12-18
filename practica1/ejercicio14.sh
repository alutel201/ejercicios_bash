#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

directorio=$1
if [ ! -d "$directorio" ]; then
    echo "Error: El directorio '$directorio' no existe."
    exit 1
fi

echo "Listado de entradas en el directorio '$directorio':"
for entrada in "$directorio"/*; do
    if [ -f "$entrada" ]; then
        echo "$entrada es un fichero."
    elif [ -d "$entrada" ]; then
        echo "$entrada es un directorio."
    fi
done

numero_entradas=$(find "$directorio" -maxdepth 1 -type f -o -type d | wc -l)
echo "numero total de entradas : $numero_entradas"

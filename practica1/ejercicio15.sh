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
        echo "$entrada es un fichero regular."
    elif [ -d "$entrada" ]; then
        echo "$entrada es un directorio."
    elif [ -L "$entrada" ]; then
        echo "$entrada es un enlace simbolico."
    elif [ -b "$entrada" ]; then
        echo "$entrada es un archivo especial de bloque."
    elif [ -c "$entrada" ]; then
        echo "$entrada es un archivo especial de caracteres."
    else
        echo "$entrada no se reconoce como un fichero, directorio, enlace simbólico, archivo especial de bloque ni archivo especial de caracteres."
    fi
done

numero_entradas=$(find "$directorio" -maxdepth 1 -type f -o -type d -o -type l -o -type b -o -type c | wc -l)
echo "Numero total de entradas procesadas: $numero_entradas"

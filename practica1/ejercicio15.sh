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
numero_entradas=0
echo "Listado de entradas en el directorio '$directorio':"
for entrada in "$directorio"/*; do
    nombre=$(basename "$entrada")
    if [ -f "$entrada" ]; then
        echo "$nombre es un fichero regular."
        ((numero_entradas++))
    elif [ -d "$entrada" ]; then
        echo "$nombre es un directorio."
        ((numero_entradas++))
    elif [ -L "$entrada" ]; then
        echo "$nombre es un enlace simbolico."
        ((numero_entradas++))
    elif [ -b "$entrada" ]; then
        echo "$nombre es un archivo especial de bloque."
        ((numero_entradas++))
    elif [ -c "$entrada" ]; then
        echo "$nombre es un archivo especial de caracteres."
        ((numero_entradas++))
    else
        echo "$nombre no se reconoce como un fichero, directorio, enlace simbolico, archivo especial de bloque ni archivo especial de caracteres."
        ((numero_entradas++))
    fi
done

echo "Numero total de entradas procesadas: $numero_entradas"

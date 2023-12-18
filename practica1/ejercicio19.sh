#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Error: Se requieren exactamente dos parametros."
    echo "Uso: $0 <archivo_origen> <nombre_copia>"
    exit 1
fi

archivo_origen=$1
nombre_copia=$2

if [ ! -f "$archivo_origen" ]; then
    echo "Error: '$archivo_origen' no existe o no es un archivo ordinario."
    exit 1
fi

if [ -e "$nombre_copia" ]; then
    echo "Error: Ya existe un identificador (archivo, directorio, etc.) con el nombre '$nombre_copia'."
    exit 1
fi

cp "$archivo_origen" "$nombre_copia"
echo "Copia exitosa: '$archivo_origen' ha sido copiado como '$nombre_copia'."

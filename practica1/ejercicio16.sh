#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

directorio=$1

if [ ! -e "$directorio" ]; then
    echo "Error: El directorio '$directorio' no existe."
    exit 1
fi

if [ ! -d "$directorio" ]; then
    echo "Error: '$directorio' no es un directorio valido."
    exit 1
fi


num_ficheros=$(find "$directorio" -maxdepth 1 -type f | wc -l)
num_subdirectorios=$(find "$directorio" -maxdepth 1 -type d | wc -l)


echo "Estadísticas del directorio '$directorio':"
echo "Numero de ficheros: $num_ficheros"
echo "Numero de subdirectorios: $num_subdirectorios"

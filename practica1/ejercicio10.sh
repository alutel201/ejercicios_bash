#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <numero>"
    exit 1
fi

numero=$1

if [ "$numero" -le 1 ]; then
    echo "$numero no es un numero primo."
    exit 0
fi

factores=$(factor $numero)

cantidad_factores=$(echo "$factores" | wc -w)

if [ "$cantidad_factores" -eq 2 ]; then
    echo "$numero es un numero primo."
else
    echo "$numero no es un numero primo."
fi

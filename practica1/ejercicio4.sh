#!/bin/bash

if [ -e $1 ]; then
    if [ -r $1 ]; then
        echo "Tienes permisos de lectura para $1."
        echo "Contenido de $1:"
        cat $1
    else
        echo "Error: No tienes permisos de lectura para $1."
    fi
else
    echo "El archivo $1 no existe."
fi

#!/bin/bash

suma=0

while true; do
    read -p "Ingrese un numero (o 0 para terminar): " numero

    if [ "$numero" -eq 0 ]; then
        echo "Suma total: $suma"
        echo "Terminando el script. ¡Hasta luego!"
        exit 0
    fi

    suma=$((suma + numero))

    echo "Suma parcial: $suma"
done

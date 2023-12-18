#!/bin/bash

read -p "Ingrese un número: " numero

if ((numero % 2 == 0)); then
    echo "$numero es un numero par."
else
    echo "$numero es un numero impar."
fi


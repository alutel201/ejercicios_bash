#!/bin/bash
if [ "$#" -eq 0 ]; then
    echo "Uso: $0 [ahora | minutos]"
    exit 1
fi
if [ "$1" == "ahora" ]; then
    echo "Apagando el equipo"
    sudo shutdown -h now
elif [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Apagando en $1 min"
    sudo shutdown -h +$1
else
    echo "Opción no válida. Uso: $0 [ahora | minutos]"
    exit 1
fi

#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: Se requiere exactamente un parametro."
    echo "Uso: $0 <nombre_usuario>"
    exit 1
fi

nombre_usuario=$1

if id "$nombre_usuario" &>/dev/null; then
    echo "El usuario '$nombre_usuario' esta dado de alta en el sistema."
    if who | grep -wq "$nombre_usuario"; then
        echo "El usuario '$nombre_usuario' ha iniciado sesion actualmente."
    else
        echo "El usuario '$nombre_usuario' no ha iniciado sesion."
    fi
else
    echo "El usuario '$nombre_usuario' no esta dado de alta en el sistema."
fi

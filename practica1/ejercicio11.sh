#!/bin/bash

numero_secreto=42

echo "¡Bienvenido al juego de adivinar el número (1-100)!"

while true; do
    read -p "Ingresa un número (o introduce 0 para rendirte): " intento

    if [ "$intento" -eq 0 ]; then
        echo "Te has rendido. El número secreto era $numero_secreto. ¡Mejor suerte la próxima vez!"
        break
    fi

    if [ "$intento" -eq "$numero_secreto" ]; then
        echo "¡Enhorabuena! Has adivinado el número secreto $numero_secreto."
        break
    elif [ "$intento" -lt "$numero_secreto" ]; then
        echo "El número es mayor. ¡Inténtalo de nuevo!"
    else
        echo "El número es menor. ¡Inténtalo de nuevo!"
    fi
done

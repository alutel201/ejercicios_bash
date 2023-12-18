#!/bin/bash

sumar() {
    resultado=$(($1 + $2))
    echo "El resultado de la suma es: $resultado"
}

restar() {
    resultado=$(($1 - $2))
    echo "El resultado de la resta es: $resultado"
}

multiplicar() {
    resultado=$(($1 * $2))
    echo "El resultado de la multiplicacion es: $resultado"
}

dividir() {
    if [ $2 -eq 0 ]; then
        echo "Error: No se puede dividir por cero."
    else
        resultado=$(awk "BEGIN {printf \"%.2f\", $1 / $2}")
        echo "El resultado de la división es: $resultado"
    fi
}

while true; do
    echo "Menú:"
    echo "1 - Sumar"
    echo "2 - Restar"
    echo "3 - Dividir"
    echo "4 - Multiplicar"
    echo "0 - Salir"

    read -p "Seleccione una opción: " opcion

    case $opcion in
        1)
            read -p "Ingrese el primer numero: " num1
            read -p "Ingrese el segundo numero: " num2
            sumar $num1 $num2
            ;;
        2)
            read -p "Ingrese el primer numero: " num1
            read -p "Ingrese el segundo numero: " num2
            restar $num1 $num2
            ;;
        3)
            read -p "Ingrese el primer numero: " num1
            read -p "Ingrese el segundo numero: " num2
            dividir $num1 $num2
            ;;
        4)
            read -p "Ingrese el primer numero: " num1
            read -p "Ingrese el segundo numero: " num2
            multiplicar $num1 $num2
            ;;
        0)
            echo "Saliendo del programa. ¡Hasta luego!"
            exit 0
            ;;
        *)
            echo "Opcion no valida. Por favor, seleccione una opcion valida."
            ;;
    esac
done

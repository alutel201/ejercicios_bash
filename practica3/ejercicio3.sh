#!/bin/bash

if [ "$#" -lt 4 ] || [ "$#" -gt 5 ]; then
    echo "Error. La sintaxis correcta es: ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
    exit 1
fi

generar_identificativo() {
    apellido1="${1:0:2}"
    apellido2="${2:0:2}"
    inicial_nombre="${3:0:1}"
    echo "alu${apellido1}${apellido2}${inicial_nombre}"
}

accion="$1"
nombre="$2"
apellido1="$3"
apellido2="$4"
grupo="$5"

case "$accion" in
    alta)
        identificativo=$(generar_identificativo "$apellido1" "$apellido2" "$nombre")

        if [ -z "$grupo" ]; then
            grupo="$identificativo"
            groupadd "$grupo"
        fi

        useradd -m -G "$grupo" -s /bin/bash -c "Usuario $nombre $apellido1 $apellido2" -U "$identificativo"

        echo "Usuario dado de alta: $identificativo"
        ;;
    baja)
        identificativo=$(generar_identificativo "$apellido1" "$apellido2" "$nombre")

        userdel -r "$identificativo"

        if grep -q "^$grupo:" /etc/group && [ -z "$(grep -E ":[^:]*$identificativo(,|$)" /etc/group)" ]; then
            groupdel "$grupo"
        fi

        echo "Usuario dado de baja: $identificativo"
        ;;
    *)
        echo "Error. La sintaxis correcta es: ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
        exit 1
        ;;
esac

exit 0

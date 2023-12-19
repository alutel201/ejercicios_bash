#!/bin/bash


if [ "$#" -ne 1 ]; then
    echo "Error. La sintaxis correcta es: ./gestionusuarios.sh archivo_usuarios.txt"
    exit 1
fi

archivo_usuarios="$1"


if [ ! -f "$archivo_usuarios" ]; then
    echo "Error. El archivo '$archivo_usuarios' no existe."
    exit 1
fi

generar_identificativo() {
    apellido1="${1:0:2}"
    apellido2="${2:0:2}"
    inicial_nombre="${3:0:1}"
    echo "alu${apellido1}${apellido2}${inicial_nombre}"
}

while IFS= read -r linea; do
    if [ -n "$linea" ] && [ "${linea:0:1}" != "#" ]; then
        parametros=($linea)
        accion="${parametros[0]}"
        nombre="${parametros[1]}"
        apellido1="${parametros[2]}"
        apellido2="${parametros[3]}"
        grupo="${parametros[4]}"

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
                echo "Error. Acción no válida en la línea: $linea"
                ;;
        esac
    fi
done < "$archivo_usuarios"

exit 0

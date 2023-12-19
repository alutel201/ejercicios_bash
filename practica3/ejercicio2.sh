#!/bin/bash

# Utilizar find con expresiones regulares para buscar archivos con permisos --- --- rwx
find /home/alu10178201/ejercicios_bash -type f -perm -007 -exec echo {} \; > archivos_peligrosos.txt

echo "La lista de archivos peligrosos se ha guardado en archivos_peligrosos.txt"

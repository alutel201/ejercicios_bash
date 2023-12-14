#!/bin/bash

if [[ -a $1 ]]; then
   if [[ -f $1 ]]; then
      echo "Existe y es un archivo regular"
   elif [[ -d $1 ]]; then
      echo "Existe y es un directorio"
   fi
else
   echo "El archivo no existe"
fi

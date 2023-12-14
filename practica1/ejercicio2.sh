#!/bin/bash

if [[ -z $1 || -z $2 ]] ; then
   echo "Introduce dos numeros como parametro"
else
   echo $(expr $1 + $2)
fi

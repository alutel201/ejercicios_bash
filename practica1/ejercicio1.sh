#!/bin/bash

if [[ $1 -gt $2 ]]; then
   echo "$1 es mayor que $2"
elif [[ $2 -gt $1 ]]; then
   echo "$2 es mayor que $1"
else
   echo "Son iguales"
fi

#!/bin/bash

num_filas=5

for ((i=1; i<=num_filas; i++)); do
    for ((j=1; j<=i; j++)); do
        echo -n $i
    done
    echo
done

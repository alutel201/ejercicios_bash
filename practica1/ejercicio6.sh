#!/bin/bash

for (( i=1; i<=10; i++ ))
do
   echo "$i x $1 = $(expr $i \* $1)"
done

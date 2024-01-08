#!/bin/bash

last_output=$(last)

ip_lines=$(echo "$last_output" | egrep -o '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b')

echo "Usuarios que iniciaron sesion con direcciones IP:"
echo "$ip_lines"


#!/bin/bash
if [ ! -d "/root/cuarentena" ]; then
    mkdir -p /root/cuarentena
    echo "Carpeta cuarentena creada."
fi
find / -type f -name "*Hack*" -exec mv {} /root/cuarentena/ \;

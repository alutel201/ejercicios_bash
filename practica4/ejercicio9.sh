#!/bin/bash
fecha=$(date '+%Y%m%d_%H%M%S')
tar czf /root/copia_etc_$fecha.tgz /etc
echo "Copia de seguridad de /etc creada en /root/copia_etc_$fecha.tgz"

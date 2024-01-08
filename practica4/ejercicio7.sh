#!/bin/bash
if [ "$(date +%u)" -eq 7 ]; then
    rm -rf /tmp/*
fi

#!/bin/bash

uso_disco=$(df -h / | awk 'NR==2{print $5}')

echo "Uso de disco: $uso_disco"

#!/bin/bash

uso_cpu=$(top -bn1 | grep "Cpu(s)" | sed "s/.*id, *\([0-9.]*\)%.* /\1"/)

echo "Uso de CPU: $uso_cpu%"

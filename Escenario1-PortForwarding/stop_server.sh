#!/bin/bash

#Detiene el dnsmasq
sudo systemctl stop dnsmasq

#Detiene el server HTTP
sudo kill $(lsof -t -i:8080)

echo "Servidor detenido."

#!/bin/bash

#Inicia el servidor dnsmasq
sudo systemctl start dnsmasq
if [ $? -ne 0 ]; then
	echo "Error al iniciar dnsmasq."
	exit 1
fi

#Inicia el servidor HTTP (python) en el puerto 8080
sudo python3 -m http.server 8080
if [ $? -ne 0 ]; then
	echo "Error al iniciar el servidor HTTP."
fi

echo "Servidores iniciados"

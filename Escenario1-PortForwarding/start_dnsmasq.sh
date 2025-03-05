#!/bin/bash

#Vamos a chequear el estado de systemd-resolved ya que utiliza el puerto :53 y nos genera inconvenientes
#Chequeo systemd-resolved
if  systemctl is-active systemd-resolved ; then
	echo "systemd-resolved esta activo."

	#Si esta activo, desabilitarlo.
	echo "Deshabilitando systemd-resolved..."
	sudo systemctl disable systemd-resolved
	echo "systemd-resolved deshabilitado."

	#Detener systemd-resolved.
	echo "Deteniendo systemd-resolved...."
	sudo systemctl stop systemd-resolved
	echo "systemd-resolved se detuvo."
else
	echo "systemd-resolved esta detenido y deshabilitado."
fi

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

echo "Servidor DNS dnsmasq iniciado"

exit 0

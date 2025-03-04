#!/bin/bash

estado=$(sudo systemctl is-active dnsmasq)

if [ "$estado" == "active" ]; then
	echo "dnsmasq esta activo."
else
	echo "dnsmasq esta inactivo"
fi

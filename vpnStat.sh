#!/bin/bash

IFACE=$(ifconfig ppp0 2>/dev/null | grep ppp0 | awk '{print $1}' | tr -d ':')

if [ "$IFACE" = "ppp0" ]; then 
	vpnIp=$(ifconfig ppp0 | grep inet | awk '{print $2}')
	echo -e "%{F#4AFF2A}  Ip VPN $vpnIp%{u-}%{F-}"

else
	echo -e "%{F#ECDE05}  Vpn Desconectada%{u-}%{F-}"
fi


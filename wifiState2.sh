#!/bin/bash

greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"

#greenColour="%{F#4AFF2A}"
#redColour="%{F#ECDE05}%"
#endColour="%{u-}%{F-}"

state=$(nmcli radio wifi 2> /dev/null)

if [ $state == "enabled" ] ; then
conectado=$(nmcli -t -f active,ssid dev wifi | grep yes | cut -d ':' -f 2 | awk '{print $1}')
#echo -e $conectado
	echo -e ${greenColour}"WIFI Encendido ﳣ  y conectado a "$conectado${endColour}
#	echo -e "$conectado hola"
else
	echo -e "${redColour}WIFI Apagado ﳤ${endColour}"
fi


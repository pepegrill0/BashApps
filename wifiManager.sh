#!/bin/bash

#Colores
# greenColour="\e[0;32m\033[1m"
# endColour="\033[0m\e[0m"
# redColour="\e[0;31m\033[1m"
# blueColour="\e[0;34m\033[1m"
# yellowColour="\e[0;33m\033[1m"
# purpleColour="\e[0;35m\033[1m"
# turquoiseColour="\e[0;36m\033[1m"
# grayColour="\e[0;37m\033[1m"
# darkGrayColour="\e[0;90m\033[1m"

 greenColour="%{F#41EC05}"
 endColour="%{u-}%{F-}"
 redColour="%{F#EC0505}"
 blueColour="\e[0;34m\033[1m"
 yellowColour="\e[0;33m\033[1m"
 purpleColour="\e[0;35m\033[1m"
 turquoiseColour="\e[0;36m\033[1m"
 darkGrayColour="%{F#C0C2BF}"
 #darkGrayColour="\e[0;90m\033[1m"

resalta=0
wifiOn="Encender Wifi"
wifiOff="Apagar Wifi"
wifiRedes="Ver Redes disponibles"
options="$wifiOn\n$wifiOff\n$wifiRedes"

wifiState=$(nmcli radio wifi 2> /dev/null)

if [ $wifiState == "enabled" ]; then
	resalta=0
else
	resalta=1
fi

chose=$(echo -e "$options" | rofi -p "Wifi Manger" -a $resalta -dmenu -selected-row 0)

case $chose in 
	$wifiOn)
		#echo "Encender Wifi" &
		if [ $resalta -eq 0 ] ; then
			exit 1
		else
			bash -c "~/wifiOn.sh" &
		fi
			;;
	$wifiOff)
		#echo "Apagar Wifi" &
		bash -c "~/wifiOn.sh" &
			;;
	$wifiRedes)
		#echo "Ver Redes Disponibles" &
		bash -c "~/wifi.sh" &
			;;
esac

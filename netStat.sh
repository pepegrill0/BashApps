#!/bin/bash
#Colours
greenColour="\e[0;32m\033[1m"
greenLColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
yellowLColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

redes=$(nmcli device show | grep "GENERAL.TYPE" | awk '{print $2}' | tr " " "\n" )
#for red in "${redes[@]}"
for red in $redes
do
#echo $red	
if [ "$red" = "wifi" ]; then
	radioOn=$(nmcli radio wifi)
	if [ "$radioOn" = "enabled" ]; then
		wifiConectada=$(nmcli -t -f NAME c show --active)
		descripcion=$(nmcli -f "SSID,BARS"  d wifi | grep $wifiConectada | awk '{print "Red Conectada: "$1 "\nCalidad de Señal "$2 }')
		barras=$(nmcli -f "SSID,BARS" d wifi | grep $wifiConectada | awk '{print $2}')
		echo $descripcion
#		echo $barras
		percent=$(( (${#barras} / 4)*100 ))
#		echo $barras
		if [ "$percent" = "100" ]; then
			echo -e "${greenColour}$percent${endColour}"
		fi
		if [ "$percent" = "75" ]; then
			echo -e "${greenLColour}$percent${endColour}"
		fi
		if [ "$percent" = "50" ]; then
			echo -e "${yellowLColour}$percent${endColour}"
		fi
		if [ "$percent" = "25" ]; then
			echo -e "${yellowColour}$percent${endColour}"
		fi
		if [ "$percent" = "0" ]; then
			echo -e "${redColour}$percent${endColour}"
		fi
		
	fi
fi
done


#wifi=$(nmcli radio wifi)



#if [ "$wifi" = "enable" ]; then
	
#	echo "Wifi Activado" 
#else

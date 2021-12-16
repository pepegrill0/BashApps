#!/bin/bash

# da error en polibar por eso uso en hexae
#greenColour="\e[0;32m\033[1m"
#endColour="\033[0m\e[0m"
#redColour="\e[0;31m\033[1m"

greenColour="%{F#4AFF2A}"
redColour="%{F#EC0505}"
endColour="%{u-}%{F-}"

function traficNet(){
iFace="wlp7s4"
	 R1=$(cat /sys/class/net/wlp7s4/statistics/rx_bytes)
     T1=$(cat /sys/class/net/$iFace/statistics/tx_bytes)
     sleep 1
     R2=$(cat /sys/class/net/$iFace/statistics/rx_bytes)
     T2=$(cat /sys/class/net/$iFace/statistics/tx_bytes)
     TBPS=`expr $T2 - $T1`
     RBPS=`expr $R2 - $R1`
     #si quiero en Mega tengo que dividir por 1048576
	 TKBPS=`expr $TBPS / 1024`
     RKBPS=`expr $RBPS / 1024`
	 result="${greenColour} $TKBPS kB/s${endColour}-${redColour} $RKBPS kB/s${endColour}"
	 echo -e $result
}

#state=$(nmcli radio wifi 2> /dev/null)
state=$(ip link | grep wlp7s4 | grep -o 'state [[:alnum:]]\+')
#ipPublica=$(wget -q -O - https://ifconfig.me | awk '{print "Ip Publica " $1" 爵  "}')
#ipPublica=$(wget -q -O - ipinfo.io/ip | awk '{print "Ip Publica " $1" 爵  "}')
#echo $state
if [ "$state" == "state UP" ] ; then
	#conectado=$(nmcli -f IN-USE,SSID,SIGNAl device wifi list | grep '*' | awk '{print "Conectado a "$2"    "$3"%"}'| xargs)
	conectado=$(iwgetid | awk '{print $2}' | cut -d ':' -f  2 | cut -d '"' -f 2)
	#traficoRed=$(traficNet)
	ipPrivada=$(ifconfig wlp7s4 | grep 'inet [[:digit:]]\{1,3\}.\{1,3\}.\{1,3\}.\{1,3\}' | awk '{print "Ip Privada "$2" ﯱ "}')
	echo -e ${greenColour}"WIFI Encendido ﳣ  $conectado"${endColour}" | $ipPrivada "
else
	echo -e "${redColour}WIFI Apagado ﳤ${endColour}"
fi



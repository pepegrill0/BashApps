#!/bin/bash
titulo="Info_de_Red"

#Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

#Globales
declare r interfaces=$(ifconfig | grep -o '^[[:alnum:]]\{1,7\}')

function logInfoNet(){
#	interfaces=$(ifconfig | grep -o '^[[:alnum:]]\{1,7\}')

#{
#   "lo":"127.0.0.1",
#   "wlp7s4":"192.168.0.15",
#   "Ip_Publica":"186.22.173.144",
#   "Nombre_de_Red":"Colgate_dSTA2.4",
#   "InterFace":"wifi"
#}

#Nombre_de_Red		Colgate_dSTA_2.4
#ppp0        		123.123.456.8

#./netInfo.sh && cat /tmp/netInfo.log | jq ".\"wlp7s4\""
rm /tmp/netInfo.log 2> /dev/null

#echo "{" > /tmp/netInfo.log
	for interface in $interfaces;
	do
		ipNumber=$(ifconfig $interface | grep -o 'inet [[:digit:]]\{1,3\}.[[:digit:]]\{1,3\}.[[:digit:]]\{1,3\}.[[:digit:]]\{1,3\}' | awk '{print $2}')
		if [[ "$ipNumber" != "" ]]; then
			echo -e "$interface        \t\t$greenColour $ipNumber $endColour"
		else
			echo -e "$interface        \t\t$redColour Not connected $endColour" 
		fi
	done;
ipPublica=$(wget -q -O - https://ifconfig.me | awk '{print "Ip_Publica		 "$1}')
if [[ $ipPublica != "" ]]; then
	echo -e "$ipPublica" 
else
	echo -e "Ip_Publica        \t\tSin internet" 
fi	
netActiva=$(nmcli -f Name,Type con show --active | awk 'NR==2{print $1}' | xargs echo -e "$greenColour$1$endColour")
if [[ "$netActiva" != "" ]];then 
	echo -e "$netActiva" 
fi
#echo "}" >> /tmp/netInfo.log
}

logInfoNet

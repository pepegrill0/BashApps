#!/bin/bash

arg1=$1
arg2=$2
arg3=$3

so_Name=""
chars="/-\|"
ruta="/home/martin/Herramientas/"
nombre="allports"
declare -i i=0
declare -i a=0
declare -i ports=65535

trap ctrl_c INT

function ctrl_c(){
    echo -e "\n\n[+] Cancelado por es usuario..."
    tput cnorm
    exit 0
}

tput civis
for _ip in $(seq $arg2 $arg3)
do
	ip=$arg1.$_ip
	 result=$(timeout 0.5 ping -c 1 -W1 $ip 2> /dev/null | grep "ttl=[[:digit:]]\{1,3\}" | awk '{print "TTL = "$1}') 
	 if [[ "$result" ]]; then
		 ttlResult=$(echo $result | awk '{print $3}')
		 if [ $ttlResult -le 64 ]; then
			so_Name="Linux"
		 elif [ $ttlResult -gt 64 -a $ttlResult -le 124 ]; then
			so_Name="Windows"
		 else
			so_Name="UnkNown"
		 fi
		 echo "Ip Activa $ip So $so_Name"

	echo "Analizando puertos ip $ip SO $so_Name"
	echo -e "Ip $ip\nPuertos Abiertos\n$so_Name\n" >> $ruta$nombre$_ip
#
	for port in $(seq 1 $ports); do
		timeout 1 bash -c "echo > /dev/tcp/$ip/$port" 2>/dev/null && echo "Puerto $port - Abierto" >> $ruta$nombre$_ip &
		percent=$(($port*100/$ports))
		echo -en "${chars:$i:1}	$percent%" " Ip $ip\r"
		i=i+1
		if [ $i -eq 4 ]; then
			i=0
		fi
	done; wait
	i=0
	echo "Analisis de puertos ip $ip finalizado..."
    echo -e "\n"
	fi
	percent=$(($_ip*100/$arg3))
	echo -en "${chars:$a:1} $percent%" "Progreso Total\r"
	a=a+1
	if [ $a -eq 4 ]; then
		a=0
	fi
done; wait
tput cnorm

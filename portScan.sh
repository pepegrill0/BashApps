#!/bin/bash

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n\n[+] Cancelado por es usuario..."
	tput cnorm 
	exit 0
}

#escondo el cursor
tput civis
 for port in $(seq 1 65535); do
	timeout 1 bash -c "echo > /dev/tcp/$1/$port" 2>/dev/null && echo "Puerto $port - Abierto" >> port$1 & 
 done; wait
#muestro el cursor
tput cnorm

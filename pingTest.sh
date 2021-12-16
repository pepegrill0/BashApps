#!/bin/bash

trap ctrl_c INT

function ctrl_c(){
	echo "Salida"
	tput cnorm
	exit 0
}


#	xterm -hold -e "airodump-ng ${networkCard}mon" &
#	airodump_xterm_PID=$!
ping ipv6-c004-aep014-telecentro-isp.1.oca.nflxvideo.net > telecentroPing.txt &
tele=$(echo $!)
ping 172.16.4.137 > provinPing.txt &
provin=$(echo $!)
#pcPorvinPid=$!
echo "Echo $tele"
echo "Echo $provin"

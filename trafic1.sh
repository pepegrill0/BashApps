#!/bin/bash

greenColour="%{F#4AFF2A}"
redColour="%{F#EC0505}"
endColour="%{u-}%{F-}"

iFace=$1

function traficNet(){
 iFace=$1
      R1=$(cat /sys/class/net/$iFace/statistics/rx_bytes)
      T1=$(cat /sys/class/net/$iFace/statistics/tx_bytes)
      sleep 0.1
      R2=$(cat /sys/class/net/$iFace/statistics/rx_bytes)
      T2=$(cat /sys/class/net/$iFace/statistics/tx_bytes)
      TBPS=`expr $T2 - $T1`
      RBPS=`expr $R2 - $R1`
      #si quiero en Mega tengo que dividir por 1048576
      TKBPS=`expr $TBPS / 1024`
      RKBPS=`expr $RBPS / 1024`
		echo "$iFace ${greenColour} $TKBPS kB/s${endColour}-${redColour} $RKBPS kB/s${endColour}"
 }

_a=$(ifconfig $iFace 2> /dev/null)

if [[ "$_a" != "" ]]; then
ip=$(ifconfig $iFace | grep -o 'inet [[:digit:]]\{1,3\}.[[:digit:]]\{1,3\}.[[:digit:]]\{1,3\}.[[:digit:]]' | awk '{print $2}') 
	if [[ "$ip" != "" ]]; then
		if [[ "$iFace" != "lo" ]]; then
			traficNet $iFace
		fi
	fi
else
	echo ""
fi

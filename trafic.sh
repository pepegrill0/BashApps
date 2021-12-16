#!/bin/bash

greenColour="%{F#4AFF2A}"
redColour="%{F#EC0505}"
endColour="%{u-}%{F-}"

declare r iFaces=$(ifconfig | grep -o '^[[:alnum:]]\{1,7\}')

#iFaces=("ppp0" "wlp7s4")

traficNet(){
 iFace=$1
      R1=$(cat /sys/class/net/$iFace/statistics/rx_bytes)
      T1=$(cat /sys/class/net/$iFace/statistics/tx_bytes)
      sleep 1
      R2=$(cat /sys/class/net/$iFace/statistics/rx_bytes)
      T2=$(cat /sys/class/net/$iFace/statistics/tx_bytes)
      TBPS=`expr $T2 - $T1`
      RBPS=`expr $R2 - $R1`
      #si quiero en Mega tengo que dividir por 1048576
      TKBPS=`expr $TBPS / 1024`
      RKBPS=`expr $RBPS / 1024`
      echo "$iFace ${greenColour} $TKBPS kB/s${endColour}-${redColour} $RKBPS kB/s${endColour}"
 }

a=$(traficNet "ppp0" 2> /dev/null & traficNet "wlp7s4" 2>/dev/null )
echo -e $a

#result=""
#for iFace in ${iFaces[@]};
#do
#	ip=$(ifconfig $iFace | grep -o 'inet [[:digit:]]\{1,3\}.[[:digit:]]\{1,3\}.[[:digit:]]\{1,3\}.[[:digit:]]' | awk '{print $2}')
#	if [[ "$iFace" != "lo" ]];then
#		if [[  "$ip" != ""  ]]; then
#			trafico=$(traficNet $iFace) 
#			echo $trafico
#			#result+="Trafico de red $trafico - "
#		fi
#	fi
#done;

#echo -e $result

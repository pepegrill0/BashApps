#!/bin/bash

#_redes=$(iwlist wlp7s4 scan | grep -i ESSID | cut -d '"' -f 2 | cut -d ' ' -f 1)
_redes=$(iwlist wlp7s4 scan | grep -i ESSID | cut -d '"' -f 2 | cut -d ' ' -f 1 | awk '{ newvar="'📶-'"$1; print newvar}')
#echo $_redes
for i in $_redes
do
  # do whatever on $i
	echo $i
#	redes+="(📶-"$i"\n)"
#echo $redes
done
#echo $redes






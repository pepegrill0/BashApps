#!/bin/bash

tput civis
/bin/ls > /tmp/extenciones
currentPath=$(pwd)

while read p; do
	echo "$currentPath/$p"
	echo $(/usr/bin/scrub -p dod "$currentPath/$p" 1> /dev/null  2> /tmp/borrado.log && echo "$p Scrubeado" )
	echo $(/usr/bin/shred -zun 10 -v "$currentPath/$p" 1> /dev/null  2> /tmp/borrado.log && echo "$p Borrado")
done < /tmp/extenciones; wait
tput cnorm

#aBorrar=$(pwd | xargs /bin/ls | awk '{print "\""$0"\""}' 2> /dev/null)
#echo $aBorrar
#tput civis
#aBorrar=$(/bin/ls | grep '[[:alnum:]]\{0,4\}$' | awk "{print $1}")
#/bin/ls | sed -e 's/.*\(\.[a-zA-Z0-9]*\)$/\1/' | awk '{print $0}' | sort -u > /tmp/extenciones
#/bin/ls > /tmp/extenciones
#/bin/cat /tmp/extenciones
#currentPath=$(pwd)

#while read p;
#	do
#	echo "$currentPath/$p"
#		echo $(scrub -p dod "$p")
#		echo $(shred -zun 10 -v "$p")
#done < /tmp/extenciones ;wait
#tput cnorm
#echo $aBorrar

#for borro in $aBorrar
#	do
#	echo "$borro"
#		shred -f -n 10 -uvz $borro
#		echo $(pwd | xargs /bin/ls | wc -l | awk '{print "Quedan " $1" Archivos"}')
#done;wait	


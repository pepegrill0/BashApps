#!/bin/bash

#update=apt-get --just-print upgrade 2>&1 | perl -ne 'if (/Inst\s([\w,\-,\d,\.,~,:,\+]+)\s\[([\w,\-,\d,\.,~,:,\+]+)\]\s\(([\w,\-,\d,\.,~,:,\+]+)\)? /i) {print "PROGRAM: $1 INSTALLED: $2 AVAILABLE: $3\n"}' | wc -l | awk '{print "Hay " $1 " actualizacion disponibles"}'
#echo $update

sudo apt-get update 1> /dev/null 2> /dev/null

count=$(apt-get --just-print upgrade 2> /dev/null | perl -ne 'if (/Inst\s([\w,\-,\d,\.,~,:,\+]+)\s\[([\w,\-,\d,\.,~,:,\+]+)\]\s\(([\w,\-,\d,\.,~,:,\+]+)\)? /i) {print "PROGRAM: $1 INSTALLED: $2 AVAILABLE: $3\n"}' | wc -l)

if [[ $count -gt "0" ]]; then 
	echo "💥 Hay " $count " actualizaciones disponibles"
fi
if [[ $count -eq "0" ]]; then
	echo ""
fi



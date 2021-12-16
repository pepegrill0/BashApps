#!/bin/bash

spoty=$(ps -ef | sed 1d | grep  "bin/sh -c spot" | wc -l) 

if [ $spoty -le 1 ]
 then
	echo "spotify cerrado, ejecuto open"
else
	echo "spotify abierto, ejecuto play"
fi



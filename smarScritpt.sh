#!/bin/bash

i=1

while [ $i -le 60 ]
do
sudo smartctl -a /dev/sda | grep -A 22 'ID#' | awk {'print $10" "$2'}
done

#sudo smartctl -a /dev/sda | grep 241 | awk {'print $10" " $2'} && sudo smartctl -a /dev/sda | grep 242 | awk {'print $10" "$2'}

#!/bin/bash

#mate-terminal --hide-menubar -e "sudo apt upgrade --show-progress"
xterm -T "Upgrade System..." -fa "FiraCode Nerd Font" -fs 9 -e "sudo apt upgrade && echo '\nActualizacion Completa\nPresione [Enter] Para Continuar...' && read "

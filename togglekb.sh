#!/bin/bash
if [ $# -eq 0 ]
then
	if [ $(setxkbmap -query | tail -n 1 | awk '{print $2}') == "us" ]
	then
		setxkbmap de
	else
		setxkbmap us
	fi
else
	setxkbmap us,de
fi

#!/bin/bash
prompt=$(printf "no\nyes" | dmenu -p "Do you really want to exit i3?")
if [ $prompt == "yes" ] ; then
	i3-msg exit
fi

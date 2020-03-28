#!/bin/bash
# i3 quit prompt
prompt=$(printf "no\nyes" | dmenu -i -p "Do you really want to exit i3?")
if [ $prompt == "yes" ] ; then
	i3-msg exit
fi

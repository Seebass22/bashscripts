#!/bin/bash
if ls | grep -E '(\.png|\.jpg|\.jpeg)$' > /dev/null ; then
	if [ $(ls -l | grep -E '(\.png|\.jpg|\.jpeg)$' | wc -l) -eq 1 ]; then
		png="$(ls -l | awk '{print $9}' | grep -E '(\.png|\.jpg|\.jpeg)$')"
	else
		png=$(ls -l | awk '{print $9}' | grep -E '(\.png|\.jpg|\.jpeg)$'| dmenu -l 25 -i -p "which image do you want to select?")
	fi
else
	echo "no png found" && exit 1
fi
[ -z "$png" ] && exit 1
feh "$png" > /dev/null 2>&1 & disown

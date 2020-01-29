#!/bin/bash
if ls | grep -E '\.pdf$' > /dev/null ; then
	if [ $(ls -l | grep '\.pdf$' | wc -l) -eq 1 ]; then
		pdf="$(echo *.pdf)"
	else
		pdf=$(ls *.pdf | dmenu -l 25 -i -p "which PDF do you want to select?")
	fi
else
	echo "no PDFs found" && exit 1
fi
[ -z "$pdf" ] && exit 1
zathura "$pdf" --fork > /dev/null 2>&1

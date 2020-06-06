#!/bin/bash
# dmenu PDF selector
# does not prompt if only one PDF is available
# 'e' arg uses evince over zathura

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

if [ "$1" = e ]; then
	evince "$pdf" > /dev/null 2>&1 & disown
else
	zathura "$pdf" --fork > /dev/null 2>&1
fi

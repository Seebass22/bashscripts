#!/bin/bash
if ls | grep -E '\.pdf$' > /dev/null ; then
	pdf=$(ls *.pdf | dmenu -i -p "which PDF do you want to select?")
else
	echo "no PDFs found" && exit 1
fi
[ -z "$pdf" ] && exit 1
zathura "$pdf" & disown

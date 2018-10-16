#!/bin/bash
if ls | grep pdf > /dev/null ; then
	pdf=$(ls *.pdf | dmenu -i -p "which PDF do you want to select?")
fi
[ -z "$pdf" ] && echo "no PDFs found" && exit 1
zathura "$pdf" & disown

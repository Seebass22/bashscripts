#!/bin/bash
pdf=$(ls *.pdf | dmenu -i -p "which PDF do you want to select?")
[ -z $pdf ] && echo "no PDFs found" && exit 1
zathura "$pdf" & disown

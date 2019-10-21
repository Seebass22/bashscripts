#!/bin/bash
cd ~/Documents/books/
cd "$(ls -d */ | dmenu -l 25 -i -p "choose folder")"
djvus="$(echo *.djvu)"
if [ "$djvus" == '*.djvu' ]; then
	book=$(ls *.pdf | dmenu -l 25 -i -p "which book do you want to select?")
else
	book=$(ls *.pdf *.djvu | dmenu -l 25 -i -p "which book do you want to select?")
fi
if [ ! -z "$book" ]; then
	zathura "$book" --fork
fi

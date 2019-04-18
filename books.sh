#!/bin/bash
cd ~/Documents/books/
cd "$(ls -d */ | dmenu -l 25 -i -p "choose folder")"
book=$(ls *.pdf | dmenu -l 25 -i -p "which book do you want to select?")
if [ ! -z "$book" ]; then
	zathura "$book" --fork
fi

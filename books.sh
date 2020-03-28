#!/bin/bash
cd ~/Documents/books/
cd "$(ls -d */ | dmenu -l 25 -i -p "choose folder")"
book="$(find . -maxdepth 1 -iregex '.*\.pdf\|.*\.epub\|.*\.djvu' | sed 's/^..//' | dmenu -l 25 -i -p "which book do you want to select?")"
if [[ $book =~ .*\.epub ]]; then
	ebook-viewer "$book" & disown
	exit
fi

if [ ! -z "$book" ]; then
	zathura "$book" --fork
fi

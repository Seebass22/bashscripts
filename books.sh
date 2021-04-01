#!/bin/bash
# opens books in ~/Documents/books/ with zathura or calibre
openbook () {
	if [[ $book =~ .*\.epub ]]; then
		ebook-viewer "$book" & disown
		exit
	fi

	if [ ! -z "$book" ]; then
		evince "$book"
	fi
}

cd ~/Documents/books/
cd "$(ls -d */ | dmenu -l 25 -i -p "choose folder")"

#all books
if [ "$(pwd -P)" = /home/seb22/Documents/books/all ]; then
	cd ..
	book="$(find . -iregex '.*\.pdf\|.*\.epub\|.*\.djvu' | sed 's/^..//' | grep -v '^epub' | dmenu -l 25 -i -p "which book do you want to select?")"
	echo all
	openbook
	exit
fi

#in specific folder
book="$(find . -maxdepth 1 -iregex '.*\.pdf\|.*\.epub\|.*\.djvu' | sed 's/^..//' | dmenu -l 25 -i -p "which book do you want to select?")"
openbook

#!/bin/bash
if [ $# -lt 1 ]; then
	echo "error"
	exit -1
fi

for f in "$@" ; do
	file=$f
	newdir=${file%.zip}
	mkdir "$newdir"
	mv "$file" "$newdir"
	cd "$newdir"
	unzip "$file"
	mv "$file" ../
	cd ..
	mv "$newdir" music/
	mv "$file" ~/.trash/
done

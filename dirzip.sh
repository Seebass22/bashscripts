#!/bin/bash
if [ $# -ne 1 ]; then
	echo "error"
	exit -1
fi

file=$1
newdir=${file%.zip}
mkdir "$newdir"
mv "$file" "$newdir"
cd "$newdir"
unzip "$file"
mv "$file" ../

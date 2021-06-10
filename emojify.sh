#!/bin/bash
# convert text to emojis, words separated by newline

while read line
do
	input="$(echo "$line" | tr [:upper:] [:lower:])"
	echo "$input" | awk '{ gsub(/ /, "\n") gsub(/[a-z]/, ":regional_indicator_&: ") } { print $0 }'
done < "${1:-/dev/stdin}"

#!/bin/bash
first="$(xclip -selection c -o | head -n1)"
second="$(xclip -selection c -o | tail -n1)"

top="$(echo "$first" | sed 's/\t/\n/g')"
bot="$(echo "$second" | sed 's/\t/\n/g')"

lines=$(echo "$top" | wc -l)
for i in $(seq 1 $lines); do
	top_=$(echo "$top" | sed -n ${i}p)
	bot_=$(echo "$bot" | sed -n ${i}p)
	if [ "$1" = '-r' ]; then
		echo $bot_ $top_ 
	else
		echo $top_ $bot_
	fi
done

#!/bin/bash
set -e

filename="screenshot-$(date +%F_%T).png"
tmp_filename="/tmp/screenshot-$(date +%F_%T).png"

if [ "$1" == save ]; then
	import "$filename"
else
	import "$tmp_filename"
	xclip -selection c -t image/png < "$tmp_filename"
	notify-send screenshotted
fi

#!/bin/bash
if [ "$1" == save ]; then
	scrot -s
else
	scrot -s /tmp/screenshot-$(date +%F_%T).png -e 'xclip -selection c -t image/png < $f'
	notify-send screenshotted
fi

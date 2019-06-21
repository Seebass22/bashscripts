#!/bin/bash
# Give dmenu list of all unicode characters to copy.
# Shows the selected character in dunst if running.

# Must have xclip installed to even show menu.
# xclip -h >/dev/null || exit

if [ -f ~/.emails ]; then
	chosen=$(cat ~/bashscripts/.specialchars ~/.emails | grep -v "#" |  dmenu -l 20 -fn Monospace-18)
else
	chosen=$(grep -v "#" ~/bashscripts/.specialchars | dmenu -l 20 -fn Monospace-18)
fi

[ "$chosen" != "" ] || exit

c=$(echo "$chosen" | sed "s/ .*//")
echo "$c" | tr -d '\n' | xclip -selection clipboard
echo "$c" | tr -d '\n' | xclip
notify-send "'$c' copied to clipboard and primary selection." &

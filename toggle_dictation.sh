#!/bin/bash
# toggle nerd dictation

if ps aux | grep -q '[n]erd-dictation'; then
	notify-send "dictation stopped"
	nerd-dictation end
else
	notify-send "dictation started"
	nerd-dictation begin
fi

#!/bin/bash
mpdstatus="$(mpc status | sed -n '2p' | awk '{print $1}')"

ps aux | grep -q "[s]potify"
if [ $? -eq 0 ]; then
	if [ "$mpdstatus" == '[playing]' ]; then
		echo "$mpdstatus"
		mpc pause
	else
		dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
	fi
elif [ $? -eq 1 ]; then
	mpc toggle
fi

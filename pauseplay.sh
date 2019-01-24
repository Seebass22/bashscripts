#!/bin/bash
ps aux | grep "[s]potify"
if [ $? -eq 0 ]; then
	dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
elif [ $? -eq 1 ]; then
	mpc toggle
fi

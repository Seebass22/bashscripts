#!/bin/bash
# cli for spotify using DBUS

usage(){
	echo "USAGE: $0 [option]"
	echo
	echo  "options:"
	echo -e "\tstatus - show artist and song"
	echo -e "\ttoggle - toggle playing/paused"
	echo -e "\tnext - next song"
	echo -e "\tprev - prev song"
	exit 1
}

[ $# -ne 1 ] && usage

ps aux | grep -q "[s]potify" > /dev/null 2>&1
running="$?"

if [ "$running" != 0 ]; then
	echo spotify not running
	exit 1
fi

case "$1" in
	status)
		song="$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/title/{n;p}' | cut -d '"' -f 2)"
		artist="$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/artist/{n;n;p}' | cut -d '"' -f 2)"
		echo "$artist - $song"
		;;
	toggle)
		dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause > /dev/null
		;;
	next)
		dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next > /dev/null
		;;
	prev)
		dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous > /dev/null
		;;
	*)
		usage
		;;
esac


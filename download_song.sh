#!/bin/bash
mpdstatus="$(mpc status | sed -n '2p' | awk '{print $1}')"

ps aux | grep -q "[s]potify"
if [ $? -eq 0 ]; then
	if [ "$mpdstatus" == '[playing]' ]; then
		search="$(mpc status | head -n1)"
	else
		song="$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/title/{n;p}' | cut -d '"' -f 2)"
		artist="$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/artist/{n;n;p}' | cut -d '"' -f 2)"
		search="$artist - $song"
	fi
elif [ $? -eq 1 ]; then
	search="$(mpc status | head -n1)"
fi

echo "    song title: $search"
echo -n "yt video title: "

youtube-dl --get-title "ytsearch:${search}"
read -p 'Download audio? [y/n]: '
[ "$REPLY" = y ] && youtube-dl -f bestaudio "ytsearch:${search}"

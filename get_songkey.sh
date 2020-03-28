#!/bin/bash
# get key of currently playing song (MPD/spotify)
mpdstatus="$(mpc status | sed -n '2p' | awk '{print $1}')"

ps aux | grep -q "[s]potify"
if [ $? -eq 0 ]; then
	if [ "$mpdstatus" == '[playing]' ]; then
		artist="$(mpc status | head -n1 | cut -d'-' -f1)"
		title="$(mpc status | head -n1 | cut -d'-' -f2)"
	else
		title="$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/title/{n;p}' | cut -d '"' -f 2)"
		artist="$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/artist/{n;n;p}' | cut -d '"' -f 2)"
	fi
elif [ $? -eq 1 ]; then
	artist="$(mpc status -f %artist% | head -n1)"
	title="$(mpc status -f %title% | head -n1)"
fi

artistp="$(echo $artist | sed -e 's/ /+/g' -e 's/&//g')"
titlep="$(echo $title | sed -e 's/ /+/g' -e 's/&//g')"

echo "$artist - $title"
link="https://tunebat.com/Search?q=${artistp}+${titlep}"
echo "$link"
setsid firefox "$link" >/dev/null 2>&1 &

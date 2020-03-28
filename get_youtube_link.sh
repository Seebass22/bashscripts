#!/bin/bash
# get youtube link of currently playing song (MPD/spotify)
getlink(){
	id=$(youtube-dl --get-id "ytsearch:${search}")
	link="https://youtu.be/${id}"
	printf "%16s${link}\n" "link: "
	echo "$link" | xclip
}

gettitle(){
	title="$(youtube-dl --get-title "ytsearch:${search}")"
	printf "%16s${title}\n" "yt video title: "
}

mpdstatus="$(mpc status | sed -n '2p' | awk '{print $1}')"

ps aux | grep -q "[s]potify"
if [ $? -eq 0 ]; then
	if [ "$mpdstatus" == '[playing]' ]; then
		song="$(mpc status | head -n1 | cut -d'-' -f2)"
		search="$(mpc status | head -n1)"
	else
		song="$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/title/{n;p}' | cut -d '"' -f 2)"
		artist="$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/artist/{n;n;p}' | cut -d '"' -f 2)"
		search="$artist - $song"
	fi
elif [ $? -eq 1 ]; then
	song="$(mpc status | head -n1 | cut -d'-' -f2)"
	search="$(mpc status | head -n1)"
fi

song="$(echo $song | sed 's/ /%20/g')"

printf "%16s${search}\n" "song title: "
echo -e "https://bandcamp.com/search?q=$song\n"
gettitle &
getlink &

wait

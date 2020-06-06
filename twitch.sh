#!/bin/bash
# stream viewer
# loads herbstluftwm layout,
# opens stream in MPV and stream chat in qutebrowser

url="$(xclip -selection clipboard -out)"
notify-send "$url"

mkdir -p ~/.trash/twitchqb
site="$(echo $url | cut -d'.' -f2)"
if [ "$site" == twitch ]; then
	herbstclient load "$(cat ~/.config/herbstluftwm/layouts/twitch)"
	channel="$(echo $url | cut -d'/' -f4)"
	qutebrowser -R -B ~/.trash/twitchqb "https://www.twitch.tv/popout/$channel/chat?popout=" > /dev/null 2>&1 & disown
	setsid mpv -quiet "$url" > /dev/null 2>&1 &
	sleep 2;
	herbstclient focus r
elif [ "$site" == youtube ]; then
	herbstclient load "$(cat ~/.config/herbstluftwm/layouts/twitch)"
	id="$(echo $url | cut -d'?' -f2)"
	qutebrowser -R -B ~/.trash/twitchqb "https://www.youtube.com/live_chat?$id&is_popout=1" > /dev/null 2>&1 & disown
	setsid mpv -quiet "$url" > /dev/null 2>&1 &
	sleep 2;
	herbstclient focus r
else
	notify-send "invalid link"
fi

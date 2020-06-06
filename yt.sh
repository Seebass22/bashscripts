#!/bin/bash
# play URL in clipbloard in MPV

url="$(xclip -selection clipboard -out)"
notify-send "$url"
setsid mpv -quiet "$url" > /dev/null 2>&1 &

#!/bin/bash
url="$(xclip -selection clipboard -out)"
echo "$url"
setsid mpv -quiet "$url" > /dev/null 2>&1 &

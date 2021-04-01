#!/bin/bash
# herbstluftwm quit prompt

prompt=$(printf "no\nyes" | dmenu -i -p "Do you really want to exit herbstluftwm?")
if [ $prompt == "yes" ] ; then
	herbstclient quit
fi

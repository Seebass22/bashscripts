#!/bin/bash
# convert input to high-quality gif

if [ $# -eq 2 ]; then
	outfile="$2"
else
	outfile=out.gif
fi

ffmpeg -y -i "$1" -filter_complex "[0:v] palettegen" tmppalette.png
ffmpeg -y -i "$1" -i tmppalette.png -filter_complex "[0:v][1:v] paletteuse" "$outfile"
rm -f tmppalette.png

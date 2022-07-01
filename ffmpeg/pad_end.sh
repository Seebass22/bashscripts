#!/bin/bash
# pad end of video with last frame

[ $# -ne 3 ] && echo USAGE: $0 infile pad_duration outfile && exit
ffmpeg -i "$1" -vf tpad=stop_mode=clone:stop_duration="$2" -crf 18 "$3"

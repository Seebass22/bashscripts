#!/bin/bash
# scale and blur vertical video to produce landscape video with blurred sides
# creates 16:9 video

[ $# -ne 2 ] && echo "USAGE: $0 infile outfile" && exit
ffmpeg -i "$1" -vf 'split[original][copy];[copy]scale=ih*16/9:-1,crop=h=iw*9/16,gblur=sigma=20[blurred];[blurred][original]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2' "$2"

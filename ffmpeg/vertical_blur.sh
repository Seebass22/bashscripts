#~/bin/bash
# create a 9:16 aspect ratio video with blurred sides, 1080x1920 resolution
# scale and blur video to produce background

[ $# -ne 2 ] && echo USAGE: $0 infile outfile && exit
ffmpeg -i "$1" -filter_complex "[0:v]boxblur=40,scale=1080x1920,setsar=1[bg];[0:v]scale=1080:1920:force_original_aspect_ratio=decrease[fg];[bg][fg]overlay=y=(H-h)/2" -c:a copy "$2"

#!/bin/bash
# create a virtual camera sharing the screen

# set VIDEO to the dummy video device (check output of v4l2-ctl --list-devices)
# set RES to screen resolution
VIDEO="/dev/video2"
RES="1600x900"
FRAMERATE=15

if [ "$1" = "flip" ]; then
	FLIP="-vf hflip"
else
	FLIP=""
fi

ffmpeg -f x11grab -r $FRAMERATE -s $RES -i :0.0+0,0 $FLIP -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 $VIDEO

#!/bin/bash
xrandr --output HDMI-4 --mode 1920x1080 --rate 74.99
xrandr --output DVI-D-1 --auto --right-of HDMI-4
herbstclient detect_monitors

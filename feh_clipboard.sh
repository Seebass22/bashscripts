#!/bin/sh
# open image in clipboard with feh
xclip -selection c -t image/png -o | feh -

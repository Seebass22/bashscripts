#!/bin/bash
#rm '~/Downloads/rpi.jpg'
mv ~/Downloads/rpi.jpg ~/.trash/
ssh rpi '~/Documents/bashscripts/test.sh'
scp rpi:/home/pi/Pictures/temp/rpi.jpg /home/seb22/Downloads/
feh ~/Downloads/rpi.jpg

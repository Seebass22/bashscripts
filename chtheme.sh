#!/bin/bash
case $1 in
	neon)
		wal --theme sexy-neon
		;;
	scifi)
		feh --bg-scale ~/wallpapers/future_33.jpg
		wal --theme sexy-neon
		;;
	neon2)
		wal --theme base16-summerfruit
		;;
	solid)
		sed -i --follow-symlinks 's/^URxvt.transparent: true/!URxvt.transparent: true/' ~/.Xdefaults
		sed -i --follow-symlinks 's/^!URxvt.transparent: false/URxvt.transparent: false/' ~/.Xdefaults
		;;
	trans|transparent)
		sed -i --follow-symlinks 's/^URxvt.transparent: false/!URxvt.transparent: false/' ~/.Xdefaults
		sed -i --follow-symlinks 's/^!URxvt.transparent: true/URxvt.transparent: true/' ~/.Xdefaults
		;;
	green)
		wal -i ~/wallpapers/unsplash/leaf/josh-calabrese-253693-unsplash.jpg --backend colorz
		;;
	red)
		wal -i ~/wallpapers/8bit/pixelred.png
		;;
	win)
		sed -i --follow-symlinks 's/^URxvt.transparent: true/!URxvt.transparent: true/' ~/.Xdefaults
		sed -i --follow-symlinks 's/^!URxvt.transparent: false/URxvt.transparent: false/' ~/.Xdefaults
		feh --bg-scale ~/wallpapers/New/win95.jpg
		wal --theme base16-flat
		;;
	alien)
		wal -i ~/wallpapers/8bit/pixelalien.png --backend colorz
		;;
	nature)
		wal -i ~/wallpapers/8bit/greennature.png --backend colorz
		;;
	elementary)
		wal -i ~/wallpapers/elementary/Pablo\ Garcia\ Saldana.jpg --backend colorz
		;;
	grey)
		feh --bg-scale ~/wallpapers/8bit/greyforest.png
		;;
	redsky)
		wal -i ~/wallpapers/New/redsky.png --backend colorz
		;;
	cleangreen)
		wal -i ~/wallpapers/unsplash/clean/sarah-dorweiler-211779-unsplash.jpg --backend colorz
		;;
	whitegreen)
		wal -i ~/wallpapers/unsplash/color-palette/kelli-tungay-363192-unsplash.jpg --backend colorz
		;;
	forest)
		wal -i ~/wallpapers/unsplash/color-palette/mike-dennler-173199-unsplash.jpg --backend colorz
		;;
	beijing)
		wal -i ~/wallpapers/camera/IMG_3675.JPG --backend colorz
		;;
	orangebeijing)
		wal -i ~/wallpapers/camera/IMG_3633.JPG
		;;
	vibrant)
		wal -i ~/wallpapers/Vibrant/calm.jpg
		;;
	bluegreen)
		wal -i ~/wallpapers/hasty/101.jpg
		;;
	aestheticforest)
		wal -i ~/wallpapers/hasty/38.jpg
		;;
	hasty)
		feh --bg-scale ~/wallpapers/hasty/84.jpg
		wal --theme sexy-gotham
		;;
	*)
		echo "choose a vaild theme"
		cat ~/bashscripts/chtheme.sh
		;;
esac

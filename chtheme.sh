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
	nightcity)
		wal -i ~/wallpapers/Cityscapes/1433294607975-4.jpg
		;;
	elementary)
		wal -i ~/wallpapers/elementary/Pablo\ Garcia\ Saldana.jpg --backend colorz
		;;
	grey)
		feh --bg-scale ~/wallpapers/8bit/greyforest.png
		;;
	redplant)
		wal -i ~/wallpapers/unsplash/darkness/nick-fewings-660870-unsplash.jpg
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
	vibrant2)
		wal -i ~/wallpapers/unsplash/blackout/tyler-lastovich-272588-unsplash.jpg
		;;
	bluegreen)
		wal -i ~/wallpapers/hasty/101.jpg
		;;
	aestheticforest)
		wal -i ~/wallpapers/hasty/38.jpg
		;;
	facade)
		wal -i ~/wallpapers/unsplash/facade/alexandr-bormotin-472094-unsplash.jpg
		;;
	fall)
		wal -i ~/wallpapers/unsplash/color/chris-lawton-154388-unsplash.jpg --backend colorz
		;;
	positron)
		wal -i ~/wallpapers/positron_dream/Knead\ \(Final\).png
		;;
	purple)
		wal -i ~/wallpapers/Vibrant/purp.png --backend colorz
		;;
	purple-ubuntu)
		wal -i ~/wallpapers/Vibrant/purple.jpg --backend colorz
		;;
	purplestreet)
		wal -i ~/wallpapers/Vibrant/palm_mountain.jpg --backend colorz
		;;
	hardcore_subway)
		wal -i ~/wallpapers/Vibrant/subway.png
		;;
	polyred)
		wal -i ~/wallpapers/Vibrant/polyred.png
		;;
	blueitems)
		wal -i ~/wallpapers/unsplash/negative\ space\ flat\ lays/joanna-kosinska-289519-unsplash.jpg
		;;
	hasty)
		feh --bg-scale ~/wallpapers/hasty/84.jpg
		wal --theme sexy-gotham
		;;
	metal)
		feh --bg-scale ~/wallpapers/unsplash/blackout/steven-wei-129391-unsplash.jpg
		wal -f base16-black-metal-venom
		;;
	greenterm)
		wal -f base16-greenscreen
		;;
	gruvbox_light)
		wal -l -f base16-gruvbox-hard
		;;
	*)
		echo "choose a theme:"
		cat ~/bashscripts/chtheme.sh | grep ')$' | sed 's/)//' | sed 's/^[[:space:]]//' | head -n -1
		;;
esac

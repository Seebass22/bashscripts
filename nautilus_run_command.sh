#!/bin/bash
# runs command $1 on first nautilus selected file
# appends underscore to create output filename

set -o noglob
IFS=$'\n' files=($NAUTILUS_SCRIPT_SELECTED_FILE_PATHS)
set +o noglob

add_underscore() {
	extension="${1##*.}"
	filename="${1%.*}"
	echo ${filename}_.${extension}
}

output="$(add_underscore ${files[0]})"
input="${files[0]}"
"$1" "$input" "$output"

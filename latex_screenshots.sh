#!/bin/bash
# creates a gif of the history of a latex document
# checkout the first commit containing a compilable latex document before running

outputdir=summary_output
pagelayout=4x2
density=100
delay=100

compile(){
	latexmk -pdf -halt-on-error "$1"
	if [ $? -ne 0 ]; then
		echo compilation failed
		exit 1
	fi
}

# create pdf with multiple pages per pdf page
summarize(){
	pdfjam --nup $pagelayout "$1" --outfile "${1%.pdf}_summary.pdf" --landscape
	rm -f "$1"
}

convert_to_png(){
	convert -background white -alpha remove -alpha off -density $density "$1" "${1%.pdf}.png"
}

POSITIONAL=()
while [[ $# -gt 0 ]]; do
	key="$1"

	case $key in
		-i|--input)
			input="$2"
			shift # past argument
			shift # past value
			;;
		-d|--density)
			density="$2"
			shift # past argument
			shift # past value
			;;
		-l|--pagelayout)
			pagelayout="$2"
			shift # past argument
			shift # past value
			;;
		-o|--outputdir)
			outputdir="$2"
			shift # past argument
			shift # past value
			;;
		-t|--delay)
			delay="$2"
			shift # past argument
			shift # past value
			;;
		-p|--pad)
			pad_duration="$2"
			shift # past argument
			shift # past value
			;;
		*)    # unknown option
			POSITIONAL+=("$1") # save it in an array for later
			shift # past argument
			;;
	esac
done

i=1
mkdir -p "$outputdir"
if [ -z "$input" ]; then
	input="$(echo *.tex)"
fi

while true; do
	filename="$(printf '%03d' $i).pdf"
	if [ ! -f "${outputdir}/${filename%.pdf}_summary.pdf" ]; then
		compile "$input"
		mv "${input%.tex}.pdf" "$filename"
		summarize "$filename"
		mv "${filename%.pdf}_summary.pdf" "$outputdir"
	fi

	# checkout parent commit if exists
	parent="$(git rev-list --topo-order HEAD..main | tail -1)"
	if [ "$parent" == "" ]; then
		break
	else
		git checkout "$parent"
		i=$((i + 1))
	fi
	latexmk -C
done

# convert all to png
cd "$outputdir"
for f in *.pdf; do
	if [ ! -f "${f%.pdf}.png" ]; then
		convert_to_png "$f"
	fi
done

# create final gif
convert -delay $delay -loop 0 *.png final.gif
if [ -n "$pad_duration" ]; then
	ffmpeg -y -i final.gif -vf tpad=stop_mode=clone:stop_duration=$pad_duration final_padded.mp4
fi

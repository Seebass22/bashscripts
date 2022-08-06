#!/bin/bash
# creates a gif of the history of a latex document
# checkout the first commit containing a compilable latex document before running

outputdir=summary_output
pagelayout=4x2
density=100
delay=100
annotate_date=false

compile(){
	latexmk -pdf -halt-on-error "$1"
	if [ $? -ne 0 ]; then
		echo compilation failed
		exit 1
	fi
}

# create pdf with multiple pages per pdf page
summarize(){
	pdfjam --nup $pagelayout "$1" --outfile "$2" --landscape
	rm -f "$1"
}

convert_to_png(){
	convert -background white -alpha remove -alpha off -density $density "$1" "$2"
}

annotate_date() {
	date="$(git show -s --format=%cs HEAD)"

	mv "$1" "${1}.orig.png"
	convert "${1}.orig.png"  -gravity south  -pointsize 50 -stroke '#000C' \
		-strokewidth 2 -annotate 0  "$date" -stroke  none \
		-fill white -annotate 0 "$date" "$1"
	rm -f "${1}.orig.png"
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
		-a|--annotate-date)
			annotate_date="true"
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
	summary_pdf="${filename%.pdf}_summary.pdf"
	summary_png="${summary_pdf%.pdf}.png"

	if [ ! -f "${outputdir}/${summary_png}" ]; then
		compile "$input"
		mv "${input%.tex}.pdf" "$filename"
		summarize "$filename" "$summary_pdf"
		convert_to_png "$summary_pdf" "$summary_png"

		if [ "$annotate_date" == "true" ]; then
			annotate_date "$summary_png"
		fi

		rm -f "$summary_pdf"
		mv "$summary_png" "$outputdir"
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

# create final gif
cd "$outputdir"
convert -delay $delay -loop 0 *.png final.gif
if [ -n "$pad_duration" ]; then
	ffmpeg -y -i final.gif -vf tpad=stop_mode=clone:stop_duration=$pad_duration final_padded.mp4
fi

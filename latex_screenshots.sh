#!/bin/bash
# create a gif of the history of a latex document
# checkout the first commit containing a compilable latex document

outputdir=summary_output

compile(){
	latexmk -pdf ausarbeitung.tex
}

# create pdf with multiple pages per pdf page
sumarize(){
	pdfjam --nup 3x2 "$1" --outfile "${1%.pdf}_summary.pdf" --landscape
	rm -f "$1"
}

convert_to_png(){
	convert -background white -alpha remove -alpha off -density 150 "$1" ${1%.pdf}.png
}

i=1
mkdir -p "$outputdir"

while true; do
	compile
	mv *.pdf out${i}.pdf
	sumarize out${i}.pdf
	mv *.pdf "$outputdir"

	# checkout parent  commit if exists
	parent="$(git rev-list --topo-order HEAD..main | tail -1)"
	if [ "$parent" == "" ]; then
		break
	else
		git checkout "$parent"
		i=$((i + 1))
	fi
done

# convert all to png
cd "$outputdir"
for f in *.pdf; do
	convert_to_png "$f"
done

# create final gif
convert -delay 100 -loop 0 *.png final.gif

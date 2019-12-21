#!/bin/bash
outfile=output.tex

if [ $# -eq 1 ]; then
	infile="$1"
	del_in=0
	echo "converting $1"
else
	xclip -out > infile
	infile=infile
	del_in=1
	echo "reading from xclip:"
fi
head -n1 "$infile"

title="$(head -n1 "$infile")"
cat << EOF > $outfile
\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage{xeCJK}
\usepackage{hyperref}
EOF
echo "\title{$title}" >> $outfile
echo '\date{\vspace{-5ex}}' >> $outfile
echo -e '\n\\begin{document}' >> $outfile

sed -E -e 's/…/\\{ldots}/g' -e "s/’/'/g" -e 's/%/\\%/g' -e 's|^\ \ \ \ (.+)$|\\item{\1}|' -e 's/^([A-Z].*):$/\\section{\1}/'  "$infile" >> $outfile
echo -e '\n\\end{document}' >> $outfile
sed -i '/^$/d' $outfile
[ $del_in -eq 1 ] && rm -f infile

echo "output file: $outfile"

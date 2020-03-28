#!/bin/bash
# convert recipes from reddit to LaTeX
outfile=output.tex
dir=""

if [ $# -eq 1 ]; then
	xclip -out > infile
	infile=infile
	dir="$1"
else
	xclip -out > infile
	infile=infile
	echo "reading from xclip:"
fi
head -n1 "$infile"

title="$(head -n1 "$infile")"
cat << EOF > $outfile
\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage{xeCJK}
\usepackage{hyperref}

\newcommand{\point}[1]{
	\begin{itemize}
		\item{#1}
	\end{itemize}
}

EOF
echo "\title{$title}" >> $outfile
echo '\date{\vspace{-5ex}}' >> $outfile
echo -e '\n\\begin{document}\n\\maketitle' >> $outfile

sed -E -e 's/…/{\\ldots}/g' -e "s/’/'/g" -e 's/#/\\#/g' -e 's/%/\\%/g' -e 's|^\ \ \ \ (.+)$|\\point{\1}|' -e 's/^([A-Z].*):$/\\section{\1}/' -e 's/&/\\&/' "$infile" >> $outfile
echo -e '\n\\end{document}' >> $outfile
sed -i '/^$/d' $outfile
rm -f infile

echo "output file: $outfile"

if [ -n "$dir" ]; then
mkdir $dir
mv output.tex ${dir}/${dir}.tex
sed "s/filename/${dir}/g" Makefile > ${dir}/Makefile
fi

#!/bin/bash

pdflatexpath=/Library/TeX/texbin/pdflatex

tempdir=/private/tmp/latex2pngtemp
mkdir $tempdir

echo "\documentclass[preview,12pt]{standalone}" > $tempdir/source.tex
echo "\usepackage[textwidth=3in]{geometry}" >> $tempdir/source.tex
echo "\begin{document}" >> $tempdir/source.tex
echo "" >> $tempdir/source.tex
echo "\end{document}" >> $tempdir/source.tex 

code -n -w -g $tempdir/source.tex:4

$pdflatexpath --output-directory=$tempdir source.tex

convert -density 300 $tempdir/source.pdf $tempdir/image.png

./impbcopy $tempdir/image.png

rm -rf $tempdir

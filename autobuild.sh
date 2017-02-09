#!/bin/bash


SOURCE_FILES="resume.tex personal-details.tex awesome-deedy.cls publications.bib"
LETTERS=`ls coverletters/*.tex`

while true
do
	SOURCE_MODIFIED=false
	for F in $SOURCE_FILES; do
		if [ $F -nt resume.pdf ]; then
			echo $F modified
			SOURCE_MODIFIED=true
		fi
	done

	if $SOURCE_MODIFIED; then
		xelatex --mode=batchmode resume.tex
		biber resume.bcf
		xelatex --mode=batchmode resume.tex
	fi

	for L in $LETTERS; do
		PDF=`dirname $L`/`basename $L .tex`.pdf
		if [[ ( $SOURCE_MODIFIED == 'true' ) || ( $L -nt $PDF ) ]]; then
			echo $L modified
			xelatex -output-directory=`dirname $L` --mode=batchmode $L
		fi
	done

	sleep 1s
done

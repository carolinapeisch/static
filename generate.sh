#!/bin/bash

#./generate.sh inputdir outputdir

set -ex

for file in examples/simple/*; do
	head=$(head -1 $file) #isolating title
	tail=$(tail -1 $file) #isolating body
	sed 's/{{title}}/head/' template.html > $file.html # in template.html, replacing {{file}} with head, also creating a new html file
	for file in examples/simple/*; do
		find . -name "*.html" #find the newly created html files
			cp "$file" outputdir #trying to copy those files to the outputdirectory - but not sure how to do
			for file in outputdir; do #for the files in this outputdirectory
			sed 's/{{body}}/tail/' "$file.html" #now it's the tail's turn to replace the {{body}}
		done
	done
done



#!/bin/bash

# using https://github.com/ryangrose/easy-pandoc-templates

mkdir -p build
mkdir -p .pre

OPTS="--template=easy_template.html"

for i in *.pre.md; do
	sed 's/%id:\(.*\)%/<a name="\1"><\/a>/g' $i > .pre/${i%.pre.md}.md
done

for i in *..md; do
	cp $i .pre/${i%..md}.md
done

for i in .pre/*.md; do
	name=`basename $i`
	pandoc ${OPTS} -i $i -o build/${name%.*}.html
done

rm -r .pre

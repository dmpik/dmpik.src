#!/bin/bash

# using https://github.com/ryangrose/easy-pandoc-templates

mkdir -p build
mkdir -p .pre

OPTS="--template=template.html"

for i in *.pre.md; do
	sed 's/^>\(.*\)%id:\(.*\)%$/<div onClick="copyLink(this.id)" class="q" id="\2">\1<\/div>/' $i > .pre/${i%.pre.md}.md
done

for i in *..md; do
	cp $i .pre/${i%..md}.md
done

for i in .pre/*.md; do
	name=`basename $i`
	pandoc -i $i -o build/${name%.*}.html --template=template.html
done

cp style.css script.js build

rm -r .pre

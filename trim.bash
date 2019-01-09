#!/bin/sh

WIDTH=505
PWD_BASE=$(pwd)
cd svg
for name in *.svg; do
	name_png=$(echo $name | sed 's/svg/png/ig')
	inkscape $name -w $WIDTH --export-background="#000000"  --export-png=$PWD_BASE/png/black-background/$name_png
	inkscape $name -w $WIDTH --export-png=$PWD_BASE/png/no-background/$name_png
done
cd ..

cd png
for name in $(find . | grep ".png$"); do
	resized_name="tmp2.png"
	convert -resize $WIDTH"x$WIDTH" "$name" $resized_name; 
	mv $resized_name $name
done
cd ..

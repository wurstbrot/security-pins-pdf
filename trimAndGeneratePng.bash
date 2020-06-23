#!/bin/sh

WIDTH=505
PWD_BASE=$(pwd)
cd svg
for name in *.svg; do
	name_png=$(echo $name | sed 's/svg/png/ig')
	inkscape $name -w $WIDTH --export-background="#000000"  --export-png=$PWD_BASE/png/black-background/$name_png
	inkscape $name -w $WIDTH --export-background="#ffffff"  --export-png=$PWD_BASE/png/white-background/$name_png
	inkscape $name -w $WIDTH --export-png=$PWD_BASE/png/no-background/$name_png
#	inkscape $name -w $WIDTH --export-background="#ffffff"  --export-png=$name_png
#	inkscape $name -w $WIDTH --export-png=$name_png
done
cd ..

cd png
for name in $(find . | grep ".png$"); do
	trimed_name="tmp.png"
#	convert $name -layers flatten -background red  -alpha on  -fuzz 1%  -trim +repage $trimed_name; 
        convert $name -fuzz 1%  -trim +repage -flatten -quality 100 -colorspace CMYK $trimed_name;
#	convert $name -flatten -fuzz 1% -trim +repage $trimed_name; 
	resized_name="tmp2.png"
	convert -resize $WIDTH"x$WIDTH" "$trimed_name" $resized_name; 
	mv $resized_name $name
	rm $trimed_name
done
cd ..

#!/bin/bash

TARGET_BUTTON_SIZE_LENGTH=485 # 507
TARGET_BUTTON_SIZE_WIDTH=485
TARGET_MACHINE_SIZE_LENGTH=620 # 620
TARGET_MACHINE_SIZE_WIDTH=620 # 620

# Prepare schnittmarke
SCHNITTMARKE=schnittmarke-$TARGET_MACHINE_SIZE_LENGTH"x"$TARGET_MACHINE_SIZE_WIDTH".png"
convert "schnittmarke-250x250.png" -resize "$TARGET_MACHINE_SIZE_LENGTH"x"$TARGET_MACHINE_SIZE_WIDTH!" $SCHNITTMARKE
#SCHNITTMARKE="schnittmarke.png"

rm buttons/*
cp ../png/black-background/* buttons
for i in $(find buttons -type f);do
	if [ -e print/$i.pdf ]; then
		echo "Skipping print/$i.pdf"
	else
		BUTTON_RESIZED=$TARGET_BUTTON_SIZE_LENGTH"x"$TARGET_BUTTON_SIZE_WIDTH".png"
		convert "$i" -resize "$TARGET_BUTTON_SIZE_LENGTH"x"$TARGET_BUTTON_SIZE_WIDTH!" $BUTTON_RESIZED
	        convert $SCHNITTMARKE $BUTTON_RESIZED -gravity center -composite result.png
		pdflatex picture.tex
		mv picture.pdf print/$i.pdf
	fi
done

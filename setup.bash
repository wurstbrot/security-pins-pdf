#!/bin/bash

# check for font
echo "checking font..."
if fc-list | grep -i -q "hind"; then
	echo "font installed"
else
	echo "ERROR: font hind semibold needs to be installed"
	exit 1
fi

# check for directory (or symlinks)
if [ -d ../security-pins ]; then
	echo "ok"
else
	echo "ERROR: directory ../security-pins doesn't exists or does not contain the directories PNG and SVG." &&
	echo "additionally, you need to put your pins into the SVG directory or change the symlink of the security-pins-pdf/svg"
	echo "and security-pins-pdf/png directory to the correct path."
	exit 1
fi

# add font
# check that links to security-pins are correct
# setup latex
# ?

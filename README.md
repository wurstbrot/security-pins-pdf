# security-pins-pdf
Generate from given SVGs from security-pins corresponding pages with multiple buttons on one PDF to print it. The printed PDF is used to craft buttons.

## Setup
* add font Hind-SemiBold to your system (https://fonts.google.com/specimen/Hind?selection.family=Hind)
* check that links to security-pins are correct:
```
png -> ../security-pins/PNG/
svg -> ../security-pins/SVG
```
* setup latex (incl. pdflatex), inkscape
* make sure the folder _generate/print/buttons/_ exists
* run _./trimAndGeneratePdf.bash &&  ./generate/generateButtons.bash_

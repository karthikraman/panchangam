#!/bin/bash
if [[ $# -ne 1 ]]
then
    echo "Usage: ./gen_png.sh <../pdf/madrapurI-5121-śārvarī-festival-tweet-images-devangari.pdf>"
    exit 1
fi
nPages=`pdfinfo "$1" | grep Pages | sed 's/[^0-9]*//'`
pngpref="${1/-festival-tweet-images-devangari.pdf/-fest-tweet}"
pngpref="${pngpref/*\//}"
echo $pngpref
name=`basename $1 | sed 's/\([0-9]\)-.*/\1/'`
mkdir -p $name
k=1
while [ $k -le $nPages ]
do
pdftoppm "$1" $name/$pngpref-"`printf "%04d" $k`" -png -rx 300 -ry 300 -f $(( k+1 )) -singlefile
k=$(( k+1 ))
echo -ne .
if [[ $(( k%20 )) -eq 0 ]]
then
    echo "`printf "%4d" $k`" pages converted.
fi
done
echo Total of $k pages converted.
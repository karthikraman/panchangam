#!/bin/bash
if [[ $# -ne 2 ]]
then
    echo "Usage: ./gen_png.sh <../pdf/madrapurI-5122-plava-devanagari-daily.pdf> 'April 14, 2021'"
    exit 1
fi
nPages=367
start_date=`date --date "$2"`
name=`basename $1 | sed 's/\([0-9]\)-.*/\1/'`
echo Subject,Start Date,Start Time,End Date,End Time,Location > $name.csv
mkdir -p $name/daily
k=1
while [ $k -le $nPages ]
do
pdftoppm "$1" $name/daily/"`printf "%03d" $k`" -png -rx 300 -ry 300 -f $(( k+1 )) -singlefile
echo `date --date "$start_date +$((k-1)) days" "+%d %B %Y"`,`date --date "$start_date +$((k-2)) days" "+%d-%m-%y"`,20:00,`date --date "$start_date +$((k-2)) days" "+%d-%m-%y"`,20:30,https://github.com/karthikraman/panchangam/raw/master/png/$name/daily/`printf "%03d" $k`.png >> $name.csv
k=$(( k+1 ))
echo -ne .
if [[ $(( k%20 )) -eq 0 ]]
then
    echo "`printf "%4d" $k`" pages converted.
fi
done
echo Total of $k pages converted.

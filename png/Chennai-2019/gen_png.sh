#!/bin/bash
k=1
while [ $k -le 367 ]
do
name=${1/.pdf/}
name=${name/daily-cal-/}
pdftoppm $1 $name-"`printf "%03d" $k`" -png -rx 150 -ry 150 -f $(( k+1 )) -singlefile
k=$(( k+1 ))
done

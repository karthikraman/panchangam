#!/bin/bash
y=1954
ymax=2100
while [[ $y -le $ymax ]]; 
do
    if [ -f ../pdf/cal-${y}-Chennai-deva.pdf ]
    then
        echo "../pdf/cal-${y}-Chennai-deva.pdf already exists!"
    else
        ./gen_monthly_cal.sh Chennai    13:05:24   80:16:12 'Asia/Calcutta' $y devanagari; 
        ./gen_ics.sh Chennai    13:05:24   80:16:12 'Asia/Calcutta' $y devanagari; 
    fi
    y=$((y+1))
done 2>150y.log

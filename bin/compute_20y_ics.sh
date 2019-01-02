#!/bin/bash
y=2001
ymax=2020
while [[ $y -le $ymax ]]; 
do
    ./gen_monthly_cal.sh Chennai    13:05:24   80:16:12 'Asia/Calcutta' $y devanagari; 
    ./gen_ics.sh Chennai    13:05:24   80:16:12 'Asia/Calcutta' $y devanagari; 
    y=$((y+1))
done >>20y_ics.log 2>&1

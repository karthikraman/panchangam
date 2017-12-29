#!/bin/bash
if [[ $# -lt 4 ]]
then
  echo "Usage: $0 <city name> <lat> <lon> <tz name> [year] [script]"
  exit 1
fi
if [[ $# -eq 6 ]]
then
  script=$6
  y=$5
elif [[ $# -eq 5 ]]
then
  y=$5
  script="devanagari"
elif [[ $# -gt 6 ]]
then
  echo "Usage: $0 <city name> <lat> <lon> <tz name> [year] [script]"
  exit 1
else
  y=`date +%Y`
  script="devanagari"
fi

city_name=$1
lat=$2
lon=$3
tz=$4
scr=${script:0:4}

echo -ne "Computing $y monthly panchangam for $city_name ($lat,$lon) - $tz in $script script... "
/
./write_monthly_panchangam_tex.py $city_name $lat $lon $tz $y $script > /tmp/cal-$y-$city_name-$scr.tex
if [[ $? -eq 0 ]]
then
  cd /tmp/
  echo "done. "
  echo -ne "Generating PDF (log --> /tmp/cal-$y-$city_name-$scr.texlog)... "
  xelatex -halt-on-error cal-$y-$city_name-$scr.tex > /tmp/cal-$y-$city_name-$scr.texlog
  echo done
else
  echo "error!"
fi
cd ../../panchangam/

echo -ne "Computing $y daily panchangam for $city_name ($lat,$lon) - $tz in $script script... "
python3 -m jyotisha.panchangam.scripts.write_daily_panchangam_tex $city_name $lat $lon $tz $y $script > /tmp/daily-cal-$y-$city_name-$scr.tex
if [[ $? -eq 0 ]]
then
  mv cal-*-log* debug_logs/
  cd /tmp/
  echo "done. "
  echo -ne "Generating PDF (log --> /tmp/cal-$y-$city_name-$scr.texlog)... "
  xelatex -halt-on-error daily-cal-$y-$city_name-$scr.tex > /tmp/cal-$y-$city_name-$scr.texlog
  echo done
  
  mv cal-$y-$city_name-$scr.pdf ~/Documents/
  mv daily-cal-$y-$city_name-$scr.pdf ~/Documents/
else
  echo "error!"
fi

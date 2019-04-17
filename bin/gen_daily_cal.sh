#!/bin/bash
if [[ $# -lt 4 ]]
then
  echo "Usage: $0 <city name> <lat> <lon> <tz name> [year] [script]"
  exit 1
fi
if [[ $# -eq 5 ]]
then
  y=$5
  script="devanagari"
elif [[ $# -eq 6 ]]
then
  y=$5
  script=$6
elif [[ $# -eq 7 ]]
then
  y=$5
  script=$6
  lagna="True"
  lagnasuff="-lagna"
elif [[ $# -gt 7 ]]
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

echo "Computing $y daily panchangam for $city_name ($lat,$lon) - $tz in $script script... "
echo "***"
cd ../panchangam/
python3 -m jyotisha.panchangam.scripts.write_daily_panchangam_tex $city_name $lat $lon $tz $y $script $lagna > ../tex/data/daily-cal-$y-$city_name-$scr$lagnasuff.tex
# mv -f cal-*-log* debug_logs/

if [[ $? -eq 0 ]]
then
  echo "***"
  echo "Completed panchangam computation successfully!"
  echo -ne "Generating PDF (log --> /tmp/cal-$y-$city_name-$scr.texlog)... "
  cd ../tex/data/
  xelatex -halt-on-error daily-cal-$y-$city_name-$scr$lagnasuff.tex > /tmp/cal-$y-$city_name-$scr.texlog
  if [[ $? -eq 0 ]]
    then
    mv daily-cal-$y-$city_name-$scr$lagnasuff.pdf ../../pdf/
    echo "done! Check out ../pdf/daily-cal-$y-$city_name-$scr$lagnasuff.pdf."
  else
    echo
    echo "!!! Error generating PDF! See /tmp/cal-$y-$city_name-$scr.texlog:"
    tail /tmp/cal-$y-$city_name-$scr.texlog
  fi
else
  echo "error!"
fi
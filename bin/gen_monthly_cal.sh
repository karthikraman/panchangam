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

echo "Computing $y monthly panchangam for $city_name ($lat,$lon) - $tz in $script script... "
echo "***"
python3 -m jyotisha.panchaanga.writer.tex.write_monthly_panchaanga_tex $city_name $lat $lon $tz $y $script > ../tex/data/cal-$y-$city_name-$scr.tex

if [[ $? -eq 0 ]]
  then
  echo "***"
  echo "Completed panchangam computation successfully!"
  echo -ne "Generating PDF (log --> /tmp/cal-$y-$city_name-$scr.texlog)... "
  cd ../tex/data/
  xelatex -halt-on-error cal-$y-$city_name-$scr.tex > /tmp/cal-$y-$city_name-$scr.texlog
  if [[ $? -eq 0 ]]
    then
    mv cal-$y-$city_name-$scr.pdf ../../pdf/
    echo "done! Check out ../pdf/cal-$y-$city_name-$scr.pdf."
  else
    echo
    echo "!!! Error generating PDF! See /tmp/cal-$y-$city_name-$scr.texlog:"
    tail /tmp/cal-$y-$city_name-$scr.texlog
  fi
else
  echo "error!"
fi

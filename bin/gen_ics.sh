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
  script="iast"
elif [[ $# -gt 6 ]]
then
  echo "Usage: $0 <city name> <lat> <lon> <tz name> [year] [script]"
  exit 1
else
  y=`date +%Y`
  script="iast"
fi

city_name=$1
lat=$2
lon=$3
tz=$4
scr=${script:0:4}

echo -ne "Computing $y ICS calendar for panchangam for $city_name ($lat,$lon) - $tz in $script script... "
cd ../panchangam
python3 -m jyotisha.panchangam.scripts.ics $city_name $lat $lon $tz $y $script
if [[ $? -eq 0 ]]
then
  echo "done!"
  mv *.ics ../ics/ 
else
  echo "error!"
fi

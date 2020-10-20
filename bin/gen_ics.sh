#!/bin/bash
if [[ $# -lt 4 ]]
then
  echo "Usage: $0 <city name> <lat> <lon> <tz name> [year] [script] [mini]"
  exit 1
fi
if [[ $# -eq 7 ]]
then
  mini=$7  # Mini ICS without too many festivals
  script=$6
  y=$5
elif [[ $# -eq 6 ]]
then
  script=$6
  y=$5
elif [[ $# -eq 5 ]]
then
  y=$5
  script="iast"
elif [[ $# -gt 7 ]]
then
  echo "Usage: $0 <city name> <lat> <lon> <tz name> [year] [script] [mini]"
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
python3 -m jyotisha.panchaanga.writer.ics $city_name $lat $lon $tz $y $script $mini
if [[ $? -eq 0 ]]
then
  echo "done!"
  mv ~/Documents/*.ics ../ics/ 
else
  echo "error!"
fi

#!/bin/bash
if [[ $# -lt 4 ]]
then
  echo "Usage: $0 <city name> <lat> <lon> <tz name> [year] [script] [fmt] [lagna]"
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
  fmt=$7
elif [[ $# -eq 8 ]]
then
  y=$5
  script=$6
  fmt=$7
  lagna="True"
  lagnasuff="-lagna"
elif [[ $# -gt 7 ]]
then
  echo "Usage: $0 <city name> <lat> <lon> <tz name> [year] [script] [fmt] [lagna]"
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
python3 -m jyotisha.panchaanga.writer.write_daily_panchaanga_txt $city_name $lat $lon $tz $y $script $fmt $lagna
# mv -f cal-*-log* debug_logs/

if [[ $? -eq 0 ]]
then
  echo "***"
  echo "Completed panchangam computation successfully!"
else
  echo "error!"
fi

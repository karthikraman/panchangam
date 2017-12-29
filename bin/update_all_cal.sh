#!/bin/bash
./gen_monthly_cal.sh Chennai    13:05:24   80:16:12 'Asia/Calcutta' 2017 devanagari #Place Lat Lon TZ
./gen_daily_cal.sh Chennai    13:05:24   80:16:12 'Asia/Calcutta' 2017 devanagari lagna
./gen_ics.sh Chennai    13:05:24   80:16:12 'Asia/Calcutta' 2017 devanagari
./gen_ics.sh Chennai    13:05:24   80:16:12 'Asia/Calcutta' 2017 iast
./gen_cal.sh Palo-Alto  37:23:59 -122:08:34 'America/Los_Angeles' 2017 devanagari
./gen_ics.sh Palo-Alto  37:23:59 -122:08:34 'America/Los_Angeles' 2017 devanagari
./gen_ics.sh Palo-Alto  37:23:59 -122:08:34 'America/Los_Angeles' 2017 iast
./gen_cal.sh London     51:30:00    0:07:00 'Europe/London' 2017
./gen_ics.sh London     51:30:00    0:07:00 'Europe/London' 2017 iast
cp ics/*2017*.ics pdf/*-2017* ~/Dropbox/panchangam/

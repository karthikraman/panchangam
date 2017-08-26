#!/usr/bin/python3

import swisseph as swe
from helper_functions import revjul

def compute_flight_sunrise_sunsets(loc_origin, loc_dest, t_start, t_end):
    """
    """
    lat_origin, lon_origin = loc_origin
    lat_dest, lon_dest = loc_dest


    print(t_start, t_end)

    h = 15 / 1440

    t = t_start

    while t < t_end:
        est_lat = lat_origin + (t - t_start) * ((lat_dest - lat_origin) / (t_end - t_start))
        est_lon = lon_origin + (t - t_start) * ((lon_dest - lon_origin) / (t_end - t_start))

        jd_sunrise = swe.rise_trans(jd_start=t, body=swe.SUN, lon=est_lon, lat=est_lat,
                                    rsmi=swe.CALC_RISE | swe.BIT_DISC_CENTER)[1][0]
        jd_sunset = swe.rise_trans(jd_start=t, body=swe.SUN, lon=est_lon, lat=est_lat,
                                   rsmi=swe.CALC_SET | swe.BIT_DISC_CENTER)[1][0]

        print('-' * 80)
        print(revjul(t))
        print(revjul(jd_sunrise))
        print(revjul(jd_sunset))

        t += h

if __name__ == '__main__':
    loc_origin = (50.1109, 8.6821)
    loc_dest = (28.6139, 77.2090)
    t_start = swe.julday(2017,7,26,20.25)
    t_end = swe.julday(2017,7,27,4)
    compute_flight_sunrise_sunsets(loc_origin, loc_dest, t_start, t_end)

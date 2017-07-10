#!/usr/bin/python3
import swisseph as swe
from helper_functions import revjul
from helper_functions import time
from scipy.optimize import brentq
from math import floor


def compute_lagna_float(jd, lat=13.08784, lon=80.27847, offset=0, debug=False):
    swe.set_sid_mode(swe.SIDM_LAHIRI)  # Force Lahiri Ayanamsha
    lcalc = swe.houses_ex(jd, lat, lon)[1][0] - swe.get_ayanamsa_ut(jd)
    lcalc = lcalc % 360

    if offset == 0:
        return lcalc / 30

    else:
        if (debug):
            print('offset:', offset)
            print('lcalc/30', lcalc / 30)
            print('lcalc/30 + offset = ', lcalc / 30 + offset)

        # The max expected value is somewhere between 2 and -2, with bracketing

        if (lcalc / 30 + offset) >= 3:
            return (lcalc / 30) + offset - 12
        elif (lcalc / 30 + offset) <= -3:
            return (lcalc / 30)
        else:
            return (lcalc / 30) + offset


def compute_lagna_data(jd, lat, lon, tz_off, debug=False):
    jd_sunrise = swe.rise_trans(jd_start=jd, body=swe.SUN, lon=lon, lat=lat,
                                rsmi=swe.CALC_RISE | swe.BIT_DISC_CENTER)[1][0]

    lagna_sunrise = 1 + floor(compute_lagna_float(jd_sunrise))

    lagna_list = [(x + lagna_sunrise - 1) % 12 + 1 for x in range(12)]

    lbrack = jd_sunrise - 3 / 24
    rbrack = jd_sunrise + 3 / 24
    lagna_data = []

    for lagna in lagna_list:
        # print('---\n', lagna)
        if (debug):
            print('lagna sunrise', compute_lagna_float(jd_sunrise))
            print('lbrack', compute_lagna_float(lbrack, lat, lon, -lagna))
            print('rbrack', compute_lagna_float(rbrack, lat, lon, -lagna))

        lagna_end_time = brentq(compute_lagna_float, lbrack, rbrack,
                                args=(lat, lon, -lagna, debug))
        lbrack = lagna_end_time + 1 / 24
        rbrack = lagna_end_time + 3 / 24
        lagna_data.append((lagna, lagna_end_time))
        # print(revjul(jd + 5.5 / 24), compute_lagnas(jd) / 30)
    return lagna_data


if __name__ == '__main__':
    tz_off = 5.5
    jd = swe.julday(2017, 1, 1, 0) - (tz_off / 24)
    lat = 13.08784
    lon = 80.27847
    for i in range(366):
        print(revjul(jd + i + tz_off / 24), compute_lagna_data(jd + i, lat, lon, tz_off))

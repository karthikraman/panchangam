#!/usr/bin/python3

import json
from helper_functions import romanise
from helper_functions import transliterate
from collections import OrderedDict

with open('festival_rules.json') as festivals_data:
    festival_rules = json.load(festivals_data, object_pairs_hook=OrderedDict)

with open('festival_rules_clean.json', 'w') as fp:
    json.dump(festival_rules, fp, indent=2)

for stext in festival_rules:
    stext_iast = str(transliterate(stext, 'harvardkyoto', 'iast'), 'utf8')
    page_id = romanise(stext_iast).replace('/', '-').strip('-')

    if stext.find('EkAdazI') == -1:
        URL = page_id.rstrip('-1234567890').rstrip('0123456789{}\\#')
    else:
        if page_id.find('ekadashi') != -1:
            ekad = '-'.join(page_id.split('-'))
            # Skipping first split, which must be sarva/smarta/vaishnava
            # Also skipping last, which is "ekadashi"
            URL = ekad
    festival_rules[stext]["URL"] = URL

with open('festival_rules_URL.json', 'w') as fp:
    json.dump(festival_rules, fp, indent=2)

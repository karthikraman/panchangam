# Panchangam

This project computes a _Pañcāṅgam_ for a given location and given year. It uses planetary positions from the Swiss ephemeris to (somewhat accurately) calculate important aspects of a day, particularly the five _āṅgams_, viz. _tithi_ (moon phase), _nakshatram_ (asterism), _yogam_, _karaṇam_ and  _vāram_, and also the occurrence of various Hindu festivals, which are usually decided by elaborate rules dependent on the (combinations of the) _āṅgams_.

## Key Features
1. Generate an A3 PDF of a _monthly calendar_ using Python / TeX (using `gen_monthly_cal.sh` or `write_monthly_panchangam_tex.py`)
2. Generate an A5 PDF of a _daily calendar_ using Python / TeX (using `gen_daily_cal.sh` or `write_daily_panchangam_tex.py`)
3. Generate an ICS calendar file for using with calendaring applications (using `gen_ics.sh` or `write_panchangam_ics.py`)

The PDFs and ICS are best generated using a Devanagari (and Tamil) scripts, though IAST works as well (mostly).

## Installation
Just clone this repository:
````
$ git clone https://github.com/karthikraman/panchangam.git panchangam
````
Alternatively, download a ZIP file [here](https://github.com/karthikraman/panchangam/archive/master.zip).

**Make sure you have the necessary Python/TeX packages installed, as mentioned below.**

### Dependencies
* Both Python 3 and LaTeX are necessary to generate the panchangam PDFs; to generate the ICS alone, only Python 3 suffices
* Python: [pyswisseph](https://github.com/astrorigin/pyswisseph), [SciPy](https://www.scipy.org/), [icalendar](https://pypi.python.org/pypi/icalendar) and [pytz](https://pypi.python.org/pypi/pytz)
* XeLaTeX / fontspec and a few other 'regular' packages
* Fonts: Sanskrit 2003, Candara, Vijaya (for Tamil)

## Usage
### Organisation
There are helpful scripts in the `bin` folder, while the Python codes are in the `panchangam` folder. Generated PDFs will go to the `pdf` folder and `.ics` files will go to the `ics` folder, from which they can be imported into any calendaring application.

### Examples
````
cd panchangam/bin
./gen_daily_cal.sh Chennai 13:05:24 80:16:12 'Asia/Calcutta' 2017 devanagari lagna
./gen_monthly_cal.sh Chennai 13:05:24 80:16:12 'Asia/Calcutta' 2017 devanagari
./gen_ics.sh Chennai 13:05:24 80:16:12 'Asia/Calcutta' 2017 devanagari
````
The above codes generate two PDF files (`daily-cal-2017-Chennai-deva.pdf`, `cal-2017-Chennai-deva.pdf`) and an ICS file (`Chennai-2017-devanagari.ics`) in the `pdf` and `ics` folders respectively.

## Downloadable Panchangams (PDF/ICS)
| City | Monthly Calendar | Daily Calendar | ICS Calendar |
| ---  |:----------------:|:--------------:|:------------:|
|**Chennai** (13°05'24''N, 80°16'12''E)| [A3 PDF](https://github.com/karthikraman/panchangam/raw/master/pdf/cal-2017-Chennai-deva.pdf)| [Kindle friendly PDF](https://github.com/karthikraman/panchangam/raw/master/pdf/daily-cal-2017-Chennai-deva.pdf) | [Devanagari](https://github.com/karthikraman/panchangam/raw/master/ics/Chennai-2017-devanagari.ics) / [IAST names](https://github.com/karthikraman/panchangam/raw/master/ics/Chennai-2017-iast.ics)
|**Mumbai** (18°57'36''N, 72°49'12''E)| [A3 PDF](https://github.com/karthikraman/panchangam/raw/master/pdf/cal-2017-Mumbai-deva.pdf)| [Kindle friendly PDF](https://github.com/karthikraman/panchangam/raw/master/pdf/daily-cal-2017-Mumbai-deva.pdf) 
|**London** (51°30'00''N, 0°07'00''E)| [A3 PDF](https://github.com/karthikraman/panchangam/raw/master/pdf/cal-2017-London-deva.pdf)| [Kindle friendly PDF](https://github.com/karthikraman/panchangam/raw/master/pdf/daily-cal-2017-London-deva.pdf) | [IAST](https://github.com/karthikraman/panchangam/raw/master/ics/London-2017-iast.ics)
|**Palo Alto** (37°23'59''N, 122°08'34''W)| [A3 PDF](https://github.com/karthikraman/panchangam/raw/master/pdf/cal-2017-Palo-Alto-deva.pdf)| [Kindle friendly PDF](https://github.com/karthikraman/panchangam/raw/master/pdf/daily-cal-2017-Palo-Alto-deva.pdf) | [Devanagari](https://github.com/karthikraman/panchangam/raw/master/ics/Palo-Alto-2017-devanagari.ics) / [IAST](https://github.com/karthikraman/panchangam/raw/master/ics/Palo-Alto-2017-iast.ics)


## Documentation & References
Currently, the documentation is sparse, but I hope to populate more in the `docs` folder. There are also some useful references in the `docs/ref` folder.

#### Similar software
* [drik-panchanga](https://github.com/webresh/drik-panchanga): well-written Python-based panchangam, with a nice simple GUI
* [drikpanchang.com](https://www.drikpanchang.com): online calendar, with a lot of details, festivals etc.

## Credits
Sincere thanks to the creators of pyswisseph, without which I could not have attempted this. Many thanks are due to [Ajit Krishnan](http://aupasana.com/) for so clearly explaining the panchangam process, and example festivals, which was sort of the inspiration for integrating a number of festivals. Many thanks to Saketha Nath for getting details of hundreds of festivals from obscure sources, and to the [Vaidikasri magazine](http://vaithikasri.com/), which is another veritable treasure house of these festivals.

## Disclaimer
It is very important to note that this is an _approximate_ panchangam, automatically generated, without the careful oversight of learned scholars who have the depth of knowledge to resolve the exact dates for occurrences of different festivals. Also, the ayanamsha used here conforms to the Drik panchanga. The best use of this panchangam is as an approximate guide (95% of the events are also probably spot on) --- when in doubt, consult only your own panchangam!

### Bugs
I have not extensively tested the code, especially for Southern Hemisphere locations etc. I have primarily restricted my example testing to Chennai, Mumbai, London and Palo Alto. Please let me know of any bugs or errors that you encounter by raising an issue and I'll do my best to fix them. I wish I had the time to rewrite the whole thing efficiently; there are far too many vestiges of the old code built on my then novice Python knowledge!

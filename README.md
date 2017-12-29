# Panchangam

This project computes a _Pañcāṅgam_ for a given location and given year. It uses planetary positions from the [jyotisha](https://github.com/sanskrit-coders/jyotisha) project to (somewhat accurately) calculate important aspects of a day, particularly the five _āṅgams_, viz. _tithi_ (moon phase), _nakshatram_ (asterism), _yogam_, _karaṇam_ and  _vāram_, and also the occurrence of various Hindu festivals, which are usually decided by elaborate rules dependent on the (combinations of the) _āṅgams_.

## Key Features
1. Generate an A3 PDF of a _monthly calendar_ using Python / TeX (using `gen_monthly_cal.sh` or `write_monthly_panchangam_tex.py`)
2. Generate an A5 PDF of a _daily calendar_ using Python / TeX (using `gen_daily_cal.sh` or `write_daily_panchangam_tex.py`)
3. Generate an ICS calendar file for using with calendaring applications (using `gen_ics.sh` or `write_panchangam_ics.py`)

The PDFs and ICS are best generated using a Devanagari (and Tamil) scripts, though IAST works as well (mostly).

## Installation
See [this issue](https://github.com/sanskrit-coders/jyotisha/issues/10).

**Make sure you have the necessary Python/TeX packages installed, as mentioned below.**

### Dependencies
* Both Python 3 and LaTeX are necessary to generate the panchangam PDFs; to generate the ICS alone, only Python 3 suffices
* Python: [jyotisha](https://github.com/sanskrit-coders/jyotisha).
* XeLaTeX / fontspec and a few other 'regular' packages
* Fonts: Sanskrit 2003, Candara, Vijaya (for Tamil)

## Usage
### Organisation
There are helpful scripts in the `bin` folder, while the Python codes are in the https://github.com/sanskrit-coders/jyotisha repository. Generated PDFs will go to the `pdf` folder and `.ics` files will go to the `ics` folder, from which they can be imported into any calendaring application.

There is a web interface to the same library - please see https://github.com/sanskrit-coders/jyotisha repository for details.

### Examples
Please refer to required setup above.
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

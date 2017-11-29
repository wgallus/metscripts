"""Attempt to fill missing MRMS files

Sadly, the NCEP LDM MRMS feed sometimes misses important files! We need to
look at our archive and attempt to fill those holes.

"""
from __future__ import print_function

import datetime
import sys
import os
import tempfile
import subprocess

import requests


PQINSERT = "/home/meteor_ldm/bin/pqinsert"
BASE = "/isu/las/class/meteorology/mtarchive/data"
PRODS = {'GaugeCorr_QPE_01H': datetime.timedelta(minutes=60),
         'PrecipFlag': datetime.timedelta(minutes=2),
         'PrecipRate': datetime.timedelta(minutes=2),
         'RadarQualityIndex': datetime.timedelta(minutes=2),
         'RadarOnly_QPE_01H': datetime.timedelta(minutes=60),
         'RadarOnly_QPE_24H': datetime.timedelta(minutes=60),
         'SeamlessHSR': datetime.timedelta(minutes=2)}


def fetch(prod, now):
    """We have work to do!"""
    for center in ['cprk', 'bldr']:
        uri = now.strftime(("http://mrms." + center +
                            ".ncep.noaa.gov/data/2D/" +
                            prod + "/MRMS_" + prod +
                            "_00.00_%Y%m%d-%H%M%S.grib2.gz"))

        try:
            res = requests.get(uri, timeout=60)
        except requests.exceptions.ReadTimeout as _exp:
            print("Read timeout on %s" % (uri, ))
            continue
        if res.status_code == 200:
            print(("Missing %s %s fixed from %s center"
                   ) % (prod, now.strftime("%Y-%m-%dT%H:%MZ"), center))
            break
        if res is None or res.status_code != 200:
            if center == 'bldr':
                print(("----> File %s %s missing for both centers"
                       ) % (prod, now.strftime("%Y-%m-%dT%H:%MZ")))
                return

    (tmpfd, tmpfn) = tempfile.mkstemp()
    os.write(tmpfd, res.content)
    os.close(tmpfd)

    pattern = now.strftime(("/data/realtime/outgoing/grib2/"
                            "MRMS_" + prod + "_00.00_" +
                            "%Y%m%d-%H%M%S.grib2.gz"))
    cmd = "%s -p '%s' %s" % (PQINSERT, pattern, tmpfn)
    subprocess.call(cmd, shell=True)
    os.remove(tmpfn)


def workflow(prod, sts, ets):
    """Process this stuff now!"""
    now = sts
    while now < ets:
        fn = now.strftime((BASE + "/%Y/%m/%d/mrms/ncep/" +
                           prod + "/" + prod + "_00.00_%Y%m%d-%H%M%S.grib2.gz"
                           ))
        if not os.path.isfile(fn):
            fetch(prod, now)
        now += PRODS.get(prod)


def main():
    """Do Something"""
    ets = datetime.datetime.utcnow().replace(minute=0, second=0,
                                             microsecond=0)
    # Don't worry about files for the past hour, some of them come a bit
    # delayed, like GaugeCorr_QPE_01H
    ets -= datetime.timedelta(hours=1)
    sts = ets - datetime.timedelta(hours=24)
    _ = [workflow(prod, sts, ets) for prod in PRODS]


if __name__ == '__main__':
    main()

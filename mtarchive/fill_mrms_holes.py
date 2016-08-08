"""Attempt to fill missing MRMS files

Sadly, the NCEP LDM MRMS feed sometimes misses important files! We need to
look at our archive and attempt to fill those holes.

"""
import datetime
import sys
import os
import requests
import tempfile
import subprocess


BASE = "/isu/las/class/meteorology/mtarchive/data"
PRODS = {'GaugeCorr_QPE_01H': datetime.timedelta(minutes=60),
         'PrecipFlag': datetime.timedelta(minutes=2),
         'PrecipRate': datetime.timedelta(minutes=2),
         'RadarOnly_QPE_01H': datetime.timedelta(minutes=60),
         'RadarOnly_QPE_24H': datetime.timedelta(minutes=60),
         'SeamlessHSR': datetime.timedelta(minutes=2)}


def fetch(prod, now):
    """We have work to do!"""
    uri = now.strftime(("http://mrms.ncep.noaa.gov/data/2D/" +
                        prod + "/MRMS_" + prod +
                        "_00.00_%Y%m%d-%H%M%S.grib2.gz"))

    res = requests.get(uri, timeout=60)
    if res is None or res.status_code != 200:
        print("MISS %s %s" % (now.strftime("%Y-%m-%dT%H:%MZ"), prod))
        return
    (tmpfd, tmpfn) = tempfile.mkstemp()
    os.write(tmpfd, res.content)
    os.close(tmpfd)

    pattern = now.strftime(("/data/realtime/outgoing/grib2/"
                            "MRMS_" + prod + "_00.00_" +
                            "%Y%m%d-%H%M%S.grib2.gz"))
    cmd = "/home/meteor_ldm/bin/pqinsert -p '%s' %s" % (pattern, tmpfn)
    subprocess.call(cmd, shell=True)
    os.remove(tmpfn)


def do(prod, sts, ets):
    """Process this stuff now!"""
    now = sts
    while now < ets:
        fn = now.strftime((BASE + "/%Y/%m/%d/mrms/ncep/" +
                           prod + "/" + prod + "_00.00_%Y%m%d-%H%M%S.grib2.gz"
                           ))
        if not os.path.isfile(fn):
            fetch(prod, now)
        now += PRODS.get(prod)


def main(argv):
    """Do Something"""
    ets = datetime.datetime.utcnow().replace(minute=0, second=0,
                                             microsecond=0)
    # Don't worry about files for the past hour, some of them come a bit
    # delayed, like GaugeCorr_QPE_01H
    ets -= datetime.timedelta(hours=1)
    sts = ets - datetime.timedelta(hours=24)
    [do(prod, sts, ets) for prod in PRODS]

if __name__ == '__main__':
    main(sys.argv)

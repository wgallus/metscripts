"""Attempt to fill missing MRMS files

Sadly, the NCEP LDM MRMS feed sometimes misses important files! We need to
look at our archive and attempt to fill those holes.

"""
from __future__ import print_function

import datetime
import os
import tempfile
import subprocess

import requests


PQINSERT = "/home/meteor_ldm/bin/pqinsert"
BASE = "/isu/mtarchive/data"
M60 = datetime.timedelta(minutes=60)
M2 = datetime.timedelta(minutes=2)
M10 = datetime.timedelta(minutes=10)
PRODS = {
    "MultiSensor_QPE_01H_Pass2": M60,
    "MultiSensor_QPE_24H_Pass2": M60,
    "MultiSensor_QPE_72H_Pass2": M60,
    # 'MESH': M2, can't do at the moment as it has random seconds
    "PrecipFlag": M2,
    "PrecipRate": M2,
    "RadarQualityIndex": M2,
    "RadarOnly_QPE_01H": M60,
    "RadarOnly_QPE_24H": M60,
    "RadarOnly_QPE_72H": M60,
    "SeamlessHSR": M2,
}
FLASH_PRODS = {
    "CREST_MAXSOILSAT": M10,
    "CREST_MAXSTREAMFLOW": M10,
    "CREST_MAXUNITSTREAMFLOW": M10,
    "HP_MAXSTREAMFLOW": M10,
    "HP_MAXUNITSTREAMFLOW": M10,
    "QPE_ARI01H": M2,
    "QPE_ARI03H": M2,
    "QPE_ARI06H": M2,
    "QPE_ARI12H": M2,
    "QPE_ARI24H": M2,
    "QPE_ARI30M": M2,
    "QPE_ARIMAX": M2,
    "QPE_FFG01H": M2,
    "QPE_FFG03H": M2,
    "QPE_FFG06H": M2,
    "QPE_FFGMAX": M2,
    "SAC_MAXSOILSAT": M10,
    "SAC_MAXSTREAMFLOW": M10,
    "SAC_MAXUNITSTREAMFLOW": M10,
}


def is_gzipped(text):
    """Check that we have gzipped content"""
    return text[:2] == b"\x1f\x8b"


def fetch(prod, now, extra, level):
    """We have work to do!"""
    extra2 = "FLASH_" if extra != "" else ""
    for center in ["cprk", "bldr"]:
        uri = now.strftime(
            (
                "https://mrms-"
                + center
                + ".ncep.noaa.gov/data/2D/"
                + extra
                + prod
                + "/MRMS_"
                + extra2
                + prod
                + "_"
                + level
                + "_%Y%m%d-%H%M%S.grib2.gz"
            )
        )

        try:
            res = requests.get(uri, timeout=60)
        except requests.exceptions.ReadTimeout as _exp:
            print("Read timeout on %s %s" % (uri, _exp))
            continue
        except requests.exceptions.ConnectionError as _exp:
            print("Error for %s %s" % (uri, _exp))
            continue
        if res.status_code == 200:
            if is_gzipped(res.content):
                print(
                    "Missing %s %s fixed from %s center"
                    % (prod, now.strftime("%Y-%m-%dT%H:%MZ"), center)
                )
                break
            else:
                print(
                    "----> Not gzipped res from %s for %s %s"
                    % (center, prod, now.strftime("%Y-%m-%dT%H:%MZ"))
                )
        if center == "bldr":
            print(
                ("----> File %s %s missing for both centers")
                % (prod, now.strftime("%Y-%m-%dT%H:%MZ"))
            )
            return

    (tmpfd, tmpfn) = tempfile.mkstemp()
    os.write(tmpfd, res.content)
    os.close(tmpfd)

    pattern = now.strftime(
        (
            "/data/realtime/outgoing/grib2/CONUS/"
            + "MRMS_"
            + extra2
            + prod
            + "_"
            + level
            + "_"
            + "%Y%m%d-%H%M%S.grib2.gz"
        )
    )
    cmd = "%s -p '%s' %s" % (PQINSERT, pattern, tmpfn)
    subprocess.call(cmd, shell=True)
    os.remove(tmpfn)


def workflow(prod, sts, ets, extra):
    """Process this stuff now!"""
    now = sts
    level = "00.50" if prod == "MESH" else "00.00"
    while now < ets:
        fn = now.strftime(
            (
                BASE
                + "/%Y/%m/%d/mrms/ncep/"
                + extra
                + prod
                + "/"
                + prod
                + "_"
                + level
                + "_%Y%m%d-%H%M%S.grib2.gz"
            )
        )
        if not os.path.isfile(fn):
            fetch(prod, now, extra, level)
        now += PRODS.get(prod, FLASH_PRODS.get(prod))


def main():
    """Do Something"""
    ets = datetime.datetime.utcnow().replace(minute=0, second=0, microsecond=0)
    # Don't worry about files for the past hour, some of them come a bit
    # delayed, like GaugeCorr_QPE_01H
    ets -= datetime.timedelta(hours=1)
    sts = ets - datetime.timedelta(hours=24)
    for prod in PRODS:
        workflow(prod, sts, ets, "")
    for prod in FLASH_PRODS:
        workflow(prod, sts, ets, "FLASH/")


if __name__ == "__main__":
    main()

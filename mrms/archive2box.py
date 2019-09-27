"""Bundle up our MRMS data to CyBox."""
import sys
import datetime
import os
import subprocess

from pyiem.util import utc, logger
from pyiem.box_utils import sendfiles2box
LOG = logger()


def do(mydir, reporterror=True):
    """Do this dir, please!"""
    if not os.path.isdir(mydir):
        if reporterror:
            LOG.info("Wanted to upload dir %s, but not found?!?", mydir)
        return
    zipfn = "%s.zip" % (mydir, )
    if os.path.isfile(zipfn):
        os.unlink(zipfn)
    subprocess.call("zip -r -q %s %s" % (zipfn, mydir), shell=True)

    remotepath = "/MRMS/%s/%s/%s" % (mydir[:4], mydir[4:6], mydir[6:8])
    res = sendfiles2box(remotepath, [zipfn, ])
    if res[0] is not None:
        os.unlink(zipfn)
        subprocess.call("rm -rf %s" % (mydir, ), shell=True)
        return
    LOG.info("sendfiles2box for %s failed", zipfn)


def main(argv):
    """Go Main Go."""
    os.chdir("/data/mrms")
    if len(argv) > 1:
        mydir = argv[1]
        do(mydir)
        return
    mydir = (utc() - datetime.timedelta(hours=6)).strftime("%Y%m%d%H")
    do(mydir)

    # reprocess with no error reported
    mydir = (utc() - datetime.timedelta(hours=12)).strftime("%Y%m%d%H")
    do(mydir, False)


if __name__ == '__main__':
    main(sys.argv)

"""Send a tar file of our daily data to CyBox!

Note, needs a ~/.netrc file with 600 perms

Lets run at 12z for the previous date
"""
import datetime
import subprocess
import os
import sys
import logging
from pyiem.ftpsession import send2box

logger = logging.getLogger()
#logger.setLevel(logging.DEBUG)
#logging.debug("Setting logging to debug...")

def run(date):
    """Upload this date's worth of data!"""
    os.chdir("/data/tmp")
    tarfn = date.strftime("mtarchive_%Y%m%d.tgz")
    # Step 1: Create a gzipped tar file
    cmd = "tar -czf %s /mnt/mtarchive/data/%s" % (tarfn,
                                                    date.strftime("%Y/%m/%d"))
    subprocess.call(cmd, shell=True, stderr=subprocess.PIPE)
    send2box(tarfn, date.strftime("/DailyMetArchive/%Y/%m"),
             tmpdir="/data/tmp")
    os.unlink(tarfn)


def main(argv):
    yesterday = datetime.date.today() - datetime.timedelta(days=1)
    run(yesterday)

if __name__ == '__main__':
    main(sys.argv)

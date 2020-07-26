"""Bundle up our MRMS data to staging for delivery to GDrive.

Runs on iem13 at the moment.
"""
import sys
import datetime
import os
import subprocess

from pyiem.util import utc, logger

LOG = logger()


def do(mydir, reporterror=True):
    """Do this dir, please!"""
    if not os.path.isdir(mydir):
        if reporterror:
            LOG.info("Wanted to upload dir %s, but not found?!?", mydir)
        return
    zipfn = "%s.zip" % (mydir,)
    if os.path.isfile(zipfn):
        os.unlink(zipfn)
    subprocess.call("zip -r -q %s %s" % (zipfn, mydir), shell=True)

    # Send to metvm0 for caching
    remotepath = "/export/mrms/%s/%s/%s" % (mydir[:4], mydir[4:6], mydir[6:8])
    cmd = (
        'rsync -a --rsync-path="mkdir -p %s && rsync" ' "%s meteor_ldm@192.168.0.200:%s"
    ) % (remotepath, zipfn, remotepath)
    subprocess.call(cmd, shell=True)

    # Send to metl60 en-route for Google Drive
    remotepath = "/stage/MRMS/%s/%s/%s" % (mydir[:4], mydir[4:6], mydir[6:8])
    cmd = (
        'rsync -a --remove-source-files --rsync-path="mkdir -p %s && rsync" '
        "%s meteor_ldm@metl60.agron.iastate.edu:%s"
    ) % (remotepath, zipfn, remotepath)
    subprocess.call(cmd, shell=True)
    subprocess.call("rm -rf %s" % (mydir,), shell=True)


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


if __name__ == "__main__":
    main(sys.argv)

"""When goes2box fails to upload, let us try again."""
import os
import glob
from pyiem.util import logger
from pyiem.ftpsession import send2box

LOG = logger()
TMPDIR = "/isu/mtarchive/tmp"


def main():
    """Go Main Go."""
    os.chdir(TMPDIR)
    for zipfn in glob.glob("goes*.zip"):
        # goes17_S_British_Columbia_20190814.zip
        bird = zipfn.split("_")[0]
        datestr = zipfn.rsplit("_", 1)[1][:-4]
        path = "/mtarchive/%s/%s/%s/cod/sat/%s" % (
            datestr[:4], int(datestr[4:6]), int(datestr[6:8]), bird
        )
        LOG.info("Sending %s to %s", zipfn, path)
        try:
            _fs, res = send2box(zipfn, path)
        except Exception as exp:
            LOG.info("sending %s resulted in exception %s", zipfn, exp)
            continue
        if res:
            os.unlink(zipfn)


if __name__ == '__main__':
    main()

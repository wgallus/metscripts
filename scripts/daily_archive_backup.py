"""Send a tar file of our daily data to staging for upload to GDrive.

Lets run at 12z for the previous date
"""
import datetime
import subprocess
import os
import logging

logger = logging.getLogger()


def run(date):
    """Upload this date's worth of data!"""
    os.chdir("/data/tmp")
    tarfn = date.strftime("mtarchive_%Y%m%d.tgz")
    # Step 1: Create a gzipped tar file
    cmd = "tar -czf %s /mnt/mtarchive/data/%s" % (tarfn,
                                                  date.strftime("%Y/%m/%d"))
    subprocess.call(cmd, shell=True, stderr=subprocess.PIPE)
    remotedir = date.strftime("/stage/DailyMetArchive/%Y/%m")
    cmd = (
        "rsync -a --remove-source-files --rsync-path \"mkdir -p %s; rsync\" "
        "%s meteor_ldm@metl60.agron.iastate.edu:%s"
    ) % (remotedir, tarfn, remotedir)
    subprocess.call(cmd, shell=True)


def main():
    """Go Main Go!"""
    yesterday = datetime.date.today() - datetime.timedelta(days=1)
    run(yesterday)


if __name__ == '__main__':
    main()

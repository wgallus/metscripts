"""Offload some COD GOES Imagery to CyBox.

see: akrherz/metscripts#1"""
import sys
import os
import datetime
import subprocess

from pyiem.ftpsession import send2box

TMPDIR = "/isu/mtarchive/tmp"


def run(bird, dt, offset):
    """Run for a given date."""
    dt = dt - datetime.timedelta(days=offset)
    path = (
        "/isu/mtarchive/data/%s/cod/sat/goes%s/subregional"
    ) % (dt.strftime("%Y/%m/%d"), bird)
    if not os.path.isdir(path):
        if offset == 0:
            print("goes2box %s not found" % (path, ))
        return
    os.chdir(path)
    zips = []
    for dirname in os.listdir("."):
        if dirname == 'HEADER.html':
            continue
        zipfn = "goes%s_%s_%s.zip" % (
            bird, dirname, dt.strftime("%Y%m%d"))
        proc = subprocess.Popen(
            "zip -q -r %s/%s %s" % (TMPDIR, zipfn, dirname),
            shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE
        )
        (stdout, stderr) = proc.communicate()
        if (stdout.decode('ascii', 'ignore') == '' and
                stderr.decode('ascii', 'ignore') == ''):
            subprocess.call("rm -rf %s" % (dirname, ), shell=True)
        else:
            print("goes2box processing goes%s/%s resulted in %s %s" % (
                bird, dirname, stdout, stderr))
        zips.append(zipfn)
    o = open("HEADER.html", 'w')
    o.write((
        "subregional imagery found <a "
        "href=\"https://iastate.box.com/s/biv6ungdrto2pyjufyg5sz9j98jlwg9u\""
        ">on CyBox</a>"))
    o.close()

    os.chdir(TMPDIR)
    _fs, ress = send2box(
        zips,
        "/mtarchive/%s/%s/%s/cod/sat/goes%s" % (
            dt.year, dt.month, dt.day, bird))
    for fn, res in zip(zips, ress):
        if res:
            os.unlink(fn)


def main(argv):
    """Go Main Go."""
    if len(argv) == 4:
        dt = datetime.datetime(int(argv[1]), int(argv[2]), int(argv[3]))
    else:
        dt = datetime.date.today() - datetime.timedelta(days=14)
    # as of 6 Feb, we need to be backprocessing 1 Jan 2018 data, can offload
    for offset in (0, 1, 14, 250, 420):
        for bird in (16, 17):
            run(bird, dt, offset)


if __name__ == '__main__':
    main(sys.argv)

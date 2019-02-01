"""Offload some COD GOES Imagery to CyBox.

see: akrherz/metscripts#1"""
import sys
import os
import datetime
import subprocess

from pyiem.ftpsession import send2box

TMPDIR = "/isu/mtarchive/tmp"


def run(bird, dt):
    """Run for a given date."""
    path = (
        "/isu/mtarchive/data/%s/cod/sat/goes%s/subregional"
    ) % (dt.strftime("%Y/%m/%d"), bird)
    if not os.path.isdir(path):
        print("goes2box %s not found" % (path, ))
        return
    os.chdir(path)
    o = open("HEADER.html", 'w')
    o.write((
        "subregional imagery found <a "
        "href=\"https://iastate.box.com/s/biv6ungdrto2pyjufyg5sz9j98jlwg9u\""
        ">on CyBox</a>"))
    o.close()
    zips = []
    for dirname in os.listdir("."):
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
    dt = datetime.datetime(int(argv[1]), int(argv[2]), int(argv[3]))
    for offset in (0, 1, 14):
        for bird in (16, 17):
            run(bird, dt - datetime.timedelta(offset))


if __name__ == '__main__':
    main(sys.argv)
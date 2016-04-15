#! /bin/csh 

set hr = ${1}
set ddir = "~/projects/metscripts/newdifax2"

foreach file ( `cat ${ddir}/${1}zfiles.txt | cut -d" " -f1` )
set newname = `cat ${ddir}/${1}zfiles.txt | grep ${file} | cut -d" " -f2`
wget -q ftp://tgftp.nws.noaa.gov/fax/${file}
convert -rotate 180 -resize 50% ${file} ${newname}
end

rm *.TIF
keep *.gif
mv *.gif /mtarchive2/data/misc/difax/

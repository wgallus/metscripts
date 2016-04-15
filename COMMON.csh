# An attempt at centralizing what the various scripts need :(

source /home/gempak/NAWIPS/Gemenviron

setenv ARCHIVE /mnt/archivewx/data
setenv CURRENT /home/www/meteor/html/wx/data/current/
setenv WEBPIX /home/www/meteor/html/pix

setenv DISPLAY :1

set ddir = "/mnt/thumper/data/"
set date1 = `date --date "${1} days ago" '+%Y/%m/%d'`
set date2 = `date --date "${1} days ago" '+%Y%m%d'`
set date3 = `date --date "${1} days ago" '+%y%m%d'`
set date4 = `date --date "${1} days ago" '+%d'`



set yy=`date -u +%y`
set mm=`date -u +%m`
set dd=`date -u +%d`
set date=${yy}${mm}${dd}
set DATE=`date -u +%Y%m%d`
set DATE2 = `date -u +%Y/%m/%d`
set hh=`date -u +%H`
set ddir2 = ${ddir}${DATE2}
source ../COMMON.csh

cp /home/www/meteor/html/pix/gemwx.gif test_d.gif

if (-e test_d.gif) then
mv test_d.gif ${ARCHIVE2}/sfc${TIMESTAMP}.gif
endif

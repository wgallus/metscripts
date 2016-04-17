source ../COMMON.csh
setenv DISPLAY localhost:1

set DATTIM=`date -u '+%y%m%d/%H%M'`

if(-e radar_sum.gif) rm radar_sum.gif

# Obtain last 3 RCM file names to obtain data over
# the past hour. Open these files in reverse order.
#
set RCM=`ls -r /data/rcm/*_rcm.dat | head -3`
set LOGFILE=radSum.out

if($#RCM < 1) then
   echo "no radar data"
   exit
endif


# cat the rcm data to a single file
set RCM1=/tmp/tmprad.$$
cat $RCM > $RCM1

gprcm << EOF > ${LOGFILE}
 MAP      = 2
 GAREA    = AFUS
 PROJ     = STR/90.0;-105.0;0.0
 SATFIL   = 
 RADFIL   = 
 LATLON   = 0
 PANEL    = 0
 TITLE    = 1/0/Radar Summary ${DATTIM}
 TEXT     = .9/21/1/hw
 CLEAR    = YES
 DEVICE   = gf|radar_sum.gif
 RCMFIL   = $RCM1
 RADTIM   = current
 RADDUR   = 50
 DITHER   = 0
 MESO     = 5/2/1/2/hw
 TVS      = 5/1/1/2/hw
 CNTR     = 0
 MAXTOP   = 0
 RADINFO  = 0
 ECHO     = 1
 CLRBAR   = 1/h/cc/.45;.06
 l
 r

 e
EOF

gpend

rm $RCM1


cd ~/current
foreach num (7 6 5 4 3 2 1 0)
        mv US_radar_sum_${num}.gif US_radar_sum_`echo ${num} + 1 | bc`.gif
end

cd ~/webscripts/tmp


mv radar_sum.gif ~/current/US_radar_sum_0.gif

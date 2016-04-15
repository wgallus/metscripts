
source ../COMMON.csh
setenv LOGFILE 	logs/www_avn.log

set device="GF|avn.gif"
set grid=/data/gempak/model/gfs/${DATE}${1}_gfs212.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f06-f48-06
DEVICE	= $device 
PANEL	= 0
TEXT	= 1.2/21//hw
CONTUR	= 1
MAP     = 31/1/1
CLEAR	= yes
CLRBAR  = 31

GAREA	= 13;-129;60;-45
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL	= 500:1000                  !0
GVCORD	= pres                      !none
GFUNC	= (sub(hght@500,hght@1000)) !pmsl@0%none
SCALE	= -1                        !0
CINT	= 6                         !4
LINE	= 3/3/1                     !20//2
GVECT	=
TITLE	= 5/-2/ ~ GFS   MSL PRESSURE, 1000-500 MB THICKNESS|^ MSLP, 1000-500 THKN!0
SKIP	= 1
FINT	=
FLINE	=
CTYPE	= c
HLSYM   = 2;1.5//21//hw
HILO    = ! 25;2/H#;L#///30;30/y 
STNPLT  = 0
\$mapfil=
list
run

exit
EOF

#
# Run GPEND to clean up
gpend
#
# Copy ps.plt to different name for eta model


cp avn.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_MSLP_thickness_f06.gif
cp avn.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_MSLP_thickness_f12.gif
cp avn.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_MSLP_thickness_f18.gif
cp avn.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_MSLP_thickness_f24.gif
cp avn.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_MSLP_thickness_f30.gif
cp avn.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_MSLP_thickness_f36.gif
cp avn.gif.006 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_MSLP_thickness_f42.gif
cp avn.gif.007 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_MSLP_thickness_f48.gif

mv avn.gif avn_01.gif
mv avn.gif.001 avn_02.gif
mv avn.gif.002 avn_03.gif
mv avn.gif.003 avn_04.gif
mv avn.gif.004 avn_05.gif
mv avn.gif.005 avn_06.gif
mv avn.gif.006 avn_07.gif
mv avn.gif.007 avn_08.gif
keep avn_0[1-8].gif 
mv avn_0[1-8].gif $WEBPIX/

#
# Run GDPLOT and generate GFS model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f60-f120-12
DEVICE	= $device 
PANEL	= 0
TEXT	= 1.2/21//hw
CONTUR	= 1
MAP     = 31/1/1
CLEAR	= yes
CLRBAR  = 31

GAREA	= 13;-129;60;-45
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL	= 500:1000                  !0
GVCORD	= pres                      !none
GFUNC	= (sub(hght@500,hght@1000)) !pmsl@0%none
SCALE	= -1                        !0
CINT	= 6                         !4
LINE	= 3/3/1                     !20//2
GVECT	=
TITLE	= 5/-2/ ~ GFS   MSL PRESSURE, 1000-500 MB THICKNESS|^ MSLP, 1000-500 THKN!0
SKIP	= 1
FINT	=
FLINE	=
CTYPE	= c
HLSYM   = 2;1.5//21//hw
HILO    = ! 25;2/H#;L#///30;30/y 
STNPLT  = 0
\$mapfil=hipowo.gsf
list
run


exit
EOF
# Copy ps.plt to different name for eta model

cp avn.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_MSLP_thickness_f60.gif
cp avn.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_MSLP_thickness_f72.gif
cp avn.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_MSLP_thickness_f84.gif
cp avn.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_MSLP_thickness_f96.gif
cp avn.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_MSLP_thickness_f108.gif
cp avn.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_MSLP_thickness_f120.gif

mv avn.gif avn_09.gif
mv avn.gif.001 avn_10.gif
mv avn.gif.002 avn_10a.gif
mv avn.gif.003 avn_10b.gif
mv avn.gif.004 avn_10c.gif
mv avn.gif.005 avn_10d.gif
keep avn_09.gif avn_10.gif avn_10[a-d].gif 
mv avn_09.gif avn_10.gif avn_10[a-d].gif $WEBPIX/

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f06-f48-06
GVCORD  = pres
GLEVEL	= 500
GVECT	= WND ! 
WIND    = bk31/0.9
SKIP    = /2;2 !
GFUNC	= (avor(wnd))           !(avor(wnd))           !hght
CINT	= 2/10/99               !2/4/8                 !6
LINE	= 7/5/1/2               !4/5/1/2               !19/1/2/1
HILO	= 2;6/X;N/10-99;10-99   !
SCALE	= 5                     !5                     ! -1
TITLE	= 5/-2/ ~ GFS  500 HEIGHTS AND VORTICITY|^ 500 HGHT AND VORTICITY!0
PROJ	= lcc/25;-95;25/1,3,0,0
FINT	= 16;20;24;28;32;36;40;44
FLINE	= 0;23-15
CTYPE	= c/f ! c
STNPLT  = 0
\$mapfil=hipowo.gsf
list
run

exit
EOF
#
# Run GPEND to clean up
#
# Copy ps.plt to different name for eta model

cp avn.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_500mb_heights_vort_f06.gif
cp avn.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_500mb_heights_vort_f12.gif
cp avn.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_500mb_heights_vort_f18.gif
cp avn.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_500mb_heights_vort_f24.gif
cp avn.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_500mb_heights_vort_f30.gif
cp avn.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_500mb_heights_vort_f36.gif
cp avn.gif.006 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_500mb_heights_vort_f42.gif
cp avn.gif.007 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_500mb_heights_vort_f48.gif

mv avn.gif avn_11.gif
mv avn.gif.001 avn_12.gif
mv avn.gif.002 avn_13.gif
mv avn.gif.003 avn_14.gif
mv avn.gif.004 avn_15.gif
mv avn.gif.005 avn_16.gif
mv avn.gif.006 avn_17.gif
mv avn.gif.007 avn_18.gif
keep avn_1[1-8].gif 
mv avn_1[1-8].gif $WEBPIX/

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f60-f120-12
GVCORD  = pres
GLEVEL	= 500
GVECT	= WND ! 
WIND    = bk31/0.9
SKIP    = /2;2 !
GFUNC	= (avor(wnd))           !(avor(wnd))           !hght
CINT	= 2/10/99               !2/4/8                 !6
LINE	= 7/5/1/2               !4/5/1/2               !19/1/2/1
HILO	= 2;6/X;N/10-99;10-99   !
SCALE	= 5                     !5                     ! -1
TITLE	= 5/-2/ ~ GFS  500 HEIGHTS AND VORTICITY|^ 500 HGHT AND VORTICITY!0
PROJ	= lcc/25;-95;25/1,3,0,0
FINT	= 16;20;24;28;32;36;40;44
FLINE	= 0;23-15
CTYPE	= c/f ! c
STNPLT  = 0
\$mapfil=hipowo.gsf
list
run

exit
EOF
#
# Run GPEND to clean up
#
# Copy ps.plt to different name for eta model

cp avn.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_500mb_heights_vort_f60.gif
cp avn.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_500mb_heights_vort_f72.gif
cp avn.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_500mb_heights_vort_f84.gif
cp avn.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_500mb_heights_vort_f96.gif
cp avn.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_500mb_heights_vort_f108.gif
cp avn.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_500mb_heights_vort_f120.gif

mv avn.gif avn_19.gif
mv avn.gif.001 avn_20.gif
mv avn.gif.002 avn_20a.gif
mv avn.gif.003 avn_20b.gif
mv avn.gif.004 avn_20c.gif
mv avn.gif.005 avn_20d.gif
keep avn_19.gif avn_20.gif avn_20[a-d].gif 
mv avn_19.gif avn_20.gif avn_20[a-d].gif $WEBPIX/

# Run GDPLOT and generate GFS model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= F06-F48-06
SCALE	= 0 !0 ! ! 3
GLEVEL  = 0 ! 0 ! 0 ! 700
GVCORD  = pres !pres  !none !pres
GFUNC   = (quo(p12m,25.4)) !(quo(p12m,25.4)) ! pmsl@0%none !omeg@700%pres
GVECT	=
CINT	= /.1/.1!0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0!4!4
LINE	= 20//1/0           !30//1/0          ! 5/1/1/3 !2/1/1/1
TITLE	= 5/-2/ ~ GFS  12-HR TOTAL PCPN, MSLP, 700 VV|^ 12-HRLY TOT PCPN, MSLP, 700 VV!0!0
SKIP	= 0
FINT    = 0.01;0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0
FLINE   = 0;21-27;24;28-30;14;15;2;5
CTYPE	= f                !f                !c  !c
HILO    =                  !                 !25;2////30;30/y !
HLSYM   = 2;1.5//21//hw
STNPLT  = 0
\$mapfil=hipowo.gsf
list
run

exit
EOF
#
# Run GPEND to clean up
#
# Copy ps.plt to different name for eta model
#mv ps.plt ps.plt_eta

cp avn.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_12hr_precip_MSLP_700VV_f06.gif
cp avn.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_12hr_precip_MSLP_700VV_f12.gif
cp avn.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_12hr_precip_MSLP_700VV_f18.gif
cp avn.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_12hr_precip_MSLP_700VV_f24.gif
cp avn.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_12hr_precip_MSLP_700VV_f30.gif
cp avn.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_12hr_precip_MSLP_700VV_f36.gif
cp avn.gif.006 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_12hr_precip_MSLP_700VV_f42.gif
cp avn.gif.007 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_12hr_precip_MSLP_700VV_f48.gif

mv avn.gif avn_21.gif
mv avn.gif.001 avn_22.gif
mv avn.gif.002 avn_23.gif
mv avn.gif.003 avn_24.gif
mv avn.gif.004 avn_25.gif
mv avn.gif.005 avn_26.gif
mv avn.gif.006 avn_27.gif
mv avn.gif.007 avn_28.gif
keep avn_2[1-8].gif
mv avn_2[1-8].gif $WEBPIX/

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= F60-F120-12
SCALE	= 0 !0 ! ! 3
GLEVEL  = 0 ! 0 ! 0 ! 700
GVCORD  = pres !pres  !none !pres
GFUNC   = (quo(p12m,25.4)) !(quo(p12m,25.4)) ! pmsl@0%none !omeg@700%pres
GVECT	=
CINT	= /.1/.1!0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0!4!4
LINE	= 20//1/0           !30//1/0          ! 5/1/1/3 !2/1/1/1
TITLE	= 5/-2/ ~ GFS  12-HR TOTAL PCPN, MSLP, 700 VV|^ 12-HRLY TOT PCPN, MSLP, 700 VV!0!0
SKIP	= 0
FINT    = 0.01;0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0
FLINE   = 0;21-27;24;28-30;14;15;2;5
CTYPE	= f                !f                !c  !c
HILO    =                  !                 !25;2////30;30/y !
HLSYM   = 2;1.5//21//hw
STNPLT  = 0
\$mapfil=hipowo.gsf
list
run

exit
EOF
#
# Run GPEND to clean up
#
# Copy ps.plt to different name for eta model
#mv ps.plt ps.plt_eta

cp avn.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_12hr_precip_MSLP_700VV_f60.gif
cp avn.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_12hr_precip_MSLP_700VV_f72.gif
cp avn.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_12hr_precip_MSLP_700VV_f84.gif
cp avn.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_12hr_precip_MSLP_700VV_f96.gif
cp avn.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_12hr_precip_MSLP_700VV_f108.gif
cp avn.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_12hr_precip_MSLP_700VV_f120.gif

mv avn.gif avn_29.gif
mv avn.gif.001 avn_30.gif
mv avn.gif.002 avn_30a.gif
mv avn.gif.003 avn_30b.gif
mv avn.gif.004 avn_30c.gif
mv avn.gif.005 avn_30d.gif
keep avn_29.gif avn_30.gif avn_30[a-d].gif 
mv avn_29.gif avn_30.gif avn_30[a-d].gif $WEBPIX/
#
#endif



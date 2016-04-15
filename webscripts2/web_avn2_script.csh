#! /bin/csh 
# 4 May 2004	Change all references to GFS

source ~/projects/metscripts/COMMON.csh
setenv LOGFILE  www_avn2
rm -f avn2.gif* >& /dev/null

#
set device="GF|avn2.gif"
set grid=/data/gempak/model/gfs/${DATE}${1}_gfs213.gem

#
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
GAREA	= 17;-122;53;-60
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL  = 0                !850              ! 700  !2
GVCORD  = pres             !pres             !pres  !hght
GFUNC   = (quo(p12m,25.4)) !(tmpc) ! (tmpc)! (tmpc)
GVECT   =
CINT    = 0.10;0.25;0.50;0.75;1.0;1.25;1.5;2.0!-5.0;0.0;2.0!-2.0;0.0;2.0 !-5.;0.;2.
LINE    = 20//2/0           !6/1/2          ! 7/1/2  ! 2/4/2
TITLE   = 5/-2/ ~ GFS 2M(RED),850MB(BLUE),700 MB T(C)|^ 2M,850,700 MB TMPC, PREC !0!0
SCALE   = 0
SKIP    = 0
FINT    = 0.05;0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0
FLINE   = 0;21-27;24;28-30;14;15;2;5
CTYPE   = f                !c                ! c  ! c
HILO    =                  !  !  !
HLSYM   =
STNPLT=0
\$mapfil=hipowo.gsf
list
run

exit
EOF
# Run GPEND to clean up
#
# Copy images to different name for eta model
if (-e avn2.gif) then

  cp avn2.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f06.gif
  cp avn2.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f12.gif
  cp avn2.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f18.gif
  cp avn2.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f24.gif
  cp avn2.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f30.gif
  cp avn2.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f36.gif
  cp avn2.gif.006 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f42.gif
  cp avn2.gif.007 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f48.gif 

  mv avn2.gif avn2_01.gif
  mv avn2.gif.001 avn2_02.gif
  mv avn2.gif.002 avn2_03.gif
  mv avn2.gif.003 avn2_04.gif
  mv avn2.gif.004 avn2_05.gif
  mv avn2.gif.005 avn2_06.gif
  mv avn2.gif.006 avn2_07.gif
  mv avn2.gif.007 avn2_08.gif
  keep avn2_0[1-8].gif
  mv avn2_0[1-8].gif $WEBPIX/
endif
$GEMEXE/gdplot_gf << EOF > $LOGFILE
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
GAREA	= 17;-122;53;-60
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL  = 0                !850              ! 700  !2
GVCORD  = pres             !pres             !pres  !hght
GFUNC   = (quo(p12m,25.4)) !(tmpc) ! (tmpc)! (tmpc)
GVECT   =
CINT    = 0.10;0.25;0.50;0.75;1.0;1.25;1.5;2.0!-5.0;0.0;2.0!-2.0;0.0;2.0 !-5.;0.;2.
LINE    = 20//2/0           !6/1/2          ! 7/1/2  ! 2/4/2
TITLE   = 5/-2/ ~ GFS 2M(RED),850MB(BLUE),700 MB T(C)|^ 2M,850,700 MB TMPC, PREC !0!0
SCALE   = 0
SKIP    = 0
FINT    = 0.05;0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0
FLINE   = 0;21-27;24;28-30;14;15;2;5
CTYPE   = f                !c                ! c  ! c
HILO    =                  !  !  !
HLSYM   =
STNPLT=0
\$mapfil=hipowo.gsf
list
run

exit
EOF
# Run GPEND to clean up
#
# Copy images to different name for eta model
if (-e avn2.gif) then

  cp avn2.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f60.gif
  cp avn2.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f72.gif
  cp avn2.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f84.gif
  cp avn2.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f96.gif
  cp avn2.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f108.gif
  cp avn2.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f120.gif

  mv avn2.gif avn2_09.gif
  mv avn2.gif.001 avn2_10.gif
  mv avn2.gif.002 avn2_10a.gif
  mv avn2.gif.003 avn2_10b.gif
  mv avn2.gif.004 avn2_10c.gif
  mv avn2.gif.005 avn2_10d.gif
  keep avn2_09.gif avn2_10.gif avn2_10[a-d].gif
  mv avn2_09.gif avn2_10.gif avn2_10[a-d].gif $WEBPIX/
endif
#
# Run GDPLOT and generate GFS model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
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

GAREA	= 15;-129;60;-45
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL	= 850                      !850    !850 
GVCORD	= pres                     !pres   !pres 
GFUNC	= dwpc                     !hght   !tmpc
SCALE	= 0                        ! 0    !0
CINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20!30 !5    
LINE	= 7/5/1/2                  ! 2/1/2/1 !32/5/2/2
GVECT	= WND
WIND    = bk4/0.9
TITLE	= 5/-2/ ~ GFS   850 HGHTS, DEW POINTS, T (C) AND WIND|^ 850 Z,TD,T,WIND!0
SKIP	= /2;2 !
FINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20
FLINE	= 27;26-16--1;14-8--2 !
CTYPE	= f ! c !c
HLSYM   = 
HILO    = 
STNPLT  = 0
\$mapfil=hipowo.gsf
list
run


exit
EOF
#
# Run GPEND to clean up
# Copy ps.plt to different name for eta model
if (-e avn2.gif) then
  
  cp avn2.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_850mb_heights_T_Td_winds_f06.gif
  cp avn2.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_850mb_heights_T_Td_winds_f12.gif
  cp avn2.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_850mb_heights_T_Td_winds_f18.gif
  cp avn2.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_850mb_heights_T_Td_winds_f24.gif
  cp avn2.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_850mb_heights_T_Td_winds_f30.gif
  cp avn2.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_850mb_heights_T_Td_winds_f36.gif
  cp avn2.gif.006 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_850mb_heights_T_Td_winds_f42.gif
  cp avn2.gif.007 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_850mb_heights_T_Td_winds_f48.gif
  
  mv avn2.gif avn2_11.gif
  mv avn2.gif.001 avn2_12.gif
  mv avn2.gif.002 avn2_13.gif
  mv avn2.gif.003 avn2_14.gif
  mv avn2.gif.004 avn2_15.gif
  mv avn2.gif.005 avn2_16.gif
  mv avn2.gif.006 avn2_17.gif
  mv avn2.gif.007 avn2_18.gif
  keep avn2_1[1-8].gif
  mv avn2_1[1-8].gif $WEBPIX/
endif
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

GAREA	= 15;-129;60;-45
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL	= 850                      !850     !850
GVCORD	= pres                     !pres    !pres
GFUNC	= dwpc                     !hght    !tmpc
SCALE	= 0                        ! 0      !0
CINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20!30!5     
LINE	= 7/5/1/2                  ! 2/1/2/1 !32/5/2/2
GVECT	= WND
WIND    = bk4/0.9
TITLE	= 5/-2/ ~ GFS  850 HGHTS, DEW POINTS, T (C) AND WIND|^ 850 Z,TD,T,WIND!0
SKIP	= /2;2 !
FINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20
FLINE	= 27;26-16--1;14-8--2 !
CTYPE	= f ! c  !c
HLSYM   = 
HILO    = 
STNPLT  = 0
\$mapfil=hipowo.gsf
list
run


exit
EOF
#
# Run GPEND to clean up
# Copy ps.plt to different name for eta model
if (-e avn2.gif) then

  cp avn2.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_850mb_heights_T_Td_winds_f60.gif
  cp avn2.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_850mb_heights_T_Td_winds_f72.gif
  cp avn2.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_850mb_heights_T_Td_winds_f84.gif
  cp avn2.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_850mb_heights_T_Td_winds_f96.gif
  cp avn2.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_850mb_heights_T_Td_winds_f108.gif
  cp avn2.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_850mb_heights_T_Td_winds_f120.gif

  mv avn2.gif avn2_19.gif
  mv avn2.gif.001 avn2_20.gif
  mv avn2.gif.002 avn2_20a.gif
  mv avn2.gif.003 avn2_20b.gif
  mv avn2.gif.004 avn2_20c.gif
  mv avn2.gif.005 avn2_20d.gif
  keep avn2_19.gif avn2_20.gif avn2_20[a-d].gif
  mv avn2_19.gif avn2_20.gif avn2_20[a-d].gif $WEBPIX/
endif
#
# Run GDPLOT and generate GFS model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GAREA	= 15;-129;60;-45
PROJ	= lcc/25;-95;25
CLRBAR  = 31
GDATTIM	= f06-f48-06

GLEVEL	= 700 
GVCORD  = pres !pres !pres
GFUNC	= relh(tmpc,dwpc)    !tmpc           !hght
GVECT   = wnd  ! !
WIND    = bk2/0.8
skip    = /2;2 !
CINT	= 10;30;50;70;90 !-20;-10;-5;0;4;6;8;10;12;14;16;18   !30
LINE	= 7/5/1/2               !32/2/2/1             !4/1/2/2
HLSYM   = 
HILO    = 
SCALE	= 0  !0 !0 
TITLE	= 5/-2/ ~ GFS  700 HEIGHTS, RH and TEMP|^ 700 HGHT, RH AND TEMP!0!0
FINT	= 10;30;50;70;90
FLINE	= 15;11;17-23-2
CTYPE	= f ! c
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
if (-e avn2.gif) then
 
  cp avn2.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_700mb_heights_RH_Temps_f06.gif
  cp avn2.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_700mb_heights_RH_Temps_f12.gif
  cp avn2.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_700mb_heights_RH_Temps_f18.gif
  cp avn2.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_700mb_heights_RH_Temps_f24.gif
  cp avn2.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_700mb_heights_RH_Temps_f30.gif
  cp avn2.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_700mb_heights_RH_Temps_f36.gif
  cp avn2.gif.006 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_700mb_heights_RH_Temps_f42.gif
  cp avn2.gif.007 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_700mb_heights_RH_Temps_f48.gif

  mv avn2.gif avn2_21.gif
  mv avn2.gif.001 avn2_22.gif
  mv avn2.gif.002 avn2_23.gif
  mv avn2.gif.003 avn2_24.gif
  mv avn2.gif.004 avn2_25.gif
  mv avn2.gif.005 avn2_26.gif
  mv avn2.gif.006 avn2_27.gif
  mv avn2.gif.007 avn2_28.gif
  keep avn2_2[1-8].gif  
  mv avn2_2[1-8].gif $WEBPIX/
endif
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GAREA	= 15;-129;60;-45
PROJ	= lcc/25;-95;25
CLRBAR  = 31
GDATTIM	= f60-f120-12

GLEVEL	= 700 
GVCORD  = pres !pres !pres
GFUNC	= relh(tmpc,dwpc)    !tmpc           !hght
GVECT   = wnd  ! !
WIND    = bk2/0.8
skip    = /2;2 !
CINT	= 10;30;50;70;90 !-20;-10;-5;0;4;6;8;10;12;14;16;18   !30
LINE	= 7/5/1/2               !32/2/2/1             !4/1/2/2
HLSYM   = 
HILO    = 
SCALE	= 0  !0 !0 
TITLE	= 5/-2/ ~ GFS  700 HEIGHTS, RH and TEMP|^ 700 HGHT, RH AND TEMP!0!0
FINT	= 10;30;50;70;90
FLINE	= 15;11;17-23-2
CTYPE	= f ! c
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
if (-e avn2.gif) then
 
  cp avn2.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_700mb_heights_RH_Temps_f60.gif
  cp avn2.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_700mb_heights_RH_Temps_f72.gif
  cp avn2.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_700mb_heights_RH_Temps_f84.gif
  cp avn2.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_700mb_heights_RH_Temps_f96.gif
  cp avn2.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_700mb_heights_RH_Temps_f108.gif
  cp avn2.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_700mb_heights_RH_Temps_f120.gif 

  mv avn2.gif avn2_29.gif
  mv avn2.gif.001 avn2_30.gif
  mv avn2.gif.002 avn2_30a.gif
  mv avn2.gif.003 avn2_30b.gif
  mv avn2.gif.004 avn2_30c.gif
  mv avn2.gif.005 avn2_30d.gif
  keep avn2_29.gif avn2_30.gif avn2_30[a-d].gif  
  mv avn2_29.gif avn2_30.gif avn2_30[a-d].gif $WEBPIX/
endif
# Run GDPLOT and generate GFS model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GAREA	= 15;-129;60;-45
PROJ	= lcc/25;-95;25
CLRBAR  = 31
GDATTIM	= f06-f48-06

GLEVEL	= 250  
GVCORD	= pres !pres  !pres
GFUNC	= sped !hght  !div(wnd)
GVECT	= ! !
CINT	= 10;20;30;40;50;60;70;80;90! 120 !2
LINE	= 7/5/1/2           !31/1/2/2  !29/1/1/1
TITLE	= 5/-2/ ~ GFS  250 MB HGHTS, WIND SPEED (M/S) AND DIV|^ 250 MB HGHTS, SPEEDS, DIV!0!
SCALE	= 0 ! 0 ! 5
SKIP	= 0 ! 0 ! 0
FINT    = 10;20;30;40;50;60;70;80;90!!
FLINE	= 0;26-16--2;14-8--2 
CTYPE	= f              !c
HLSYM   = 
HILO    = 
STNPLT  = 0
\$mapfil=hipowo.gsf
list
run

exit
EOF
#
# Run GPEND to clean up
# Copy ps.plt to different name for eta model
#mv ps.plt ps.plt_eta
if (-e avn2.gif) then

  cp avn2.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_250mb_heights_winds_DIV_f06.gif
  cp avn2.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_250mb_heights_winds_DIV_f12.gif
  cp avn2.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_250mb_heights_winds_DIV_f18.gif
  cp avn2.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_250mb_heights_winds_DIV_f24.gif
  cp avn2.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_250mb_heights_winds_DIV_f30.gif
  cp avn2.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_250mb_heights_winds_DIV_f36.gif
  cp avn2.gif.006 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_250mb_heights_winds_DIV_f42.gif
  cp avn2.gif.007 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_250mb_heights_winds_DIV_f48.gif

  mv avn2.gif avn2_31.gif
  mv avn2.gif.001 avn2_32.gif
  mv avn2.gif.002 avn2_33.gif
  mv avn2.gif.003 avn2_34.gif
  mv avn2.gif.004 avn2_35.gif
  mv avn2.gif.005 avn2_36.gif
  mv avn2.gif.006 avn2_37.gif
  mv avn2.gif.007 avn2_38.gif
  keep avn2_3[1-8].gif 
  mv avn2_3[1-8].gif $WEBPIX/
endif

# Run GDPLOT and generate GFS model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GAREA	= 15;-129;60;-45
PROJ	= lcc/25;-95;25
CLRBAR  = 31
GDATTIM	= f60-f120-12

GLEVEL	= 250  
GVCORD	= pres !pres  !pres
GFUNC	= sped !hght  !div(wnd)
GVECT	= ! !
CINT	= 10;20;30;40;50;60;70;80;90! 120 !2
LINE	= 7/5/1/2           !31/1/2/2  !29/1/1/1
TITLE	= 5/-2/ ~ GFS  250 MB HGHTS, WIND SPEED (M/S) AND DIV|^ 250 MB HGHTS, SPEEDS, DIV!0!
SCALE	= 0 ! 0 ! 5
SKIP	= 0 ! 0 ! 0
FINT    = 10;20;30;40;50;60;70;80;90!!
FLINE	= 0;26-16--2;14-8--2 
CTYPE	= f              !c
HLSYM   = 
HILO    = 
STNPLT  = 0
\$mapfil=hipowo.gsf
list
run

exit
EOF
#
# Run GPEND to clean up
# Copy ps.plt to different name for eta model
#mv ps.plt ps.plt_eta
if (-e avn2.gif) then
 
  cp avn2.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_250mb_heights_winds_DIV_f60.gif
  cp avn2.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_250mb_heights_winds_DIV_f72.gif
  cp avn2.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_250mb_heights_winds_DIV_f84.gif
  cp avn2.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_250mb_heights_winds_DIV_f96.gif
  cp avn2.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_250mb_heights_winds_DIV_f108.gif
  cp avn2.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_250mb_heights_winds_DIV_f120.gif

  mv avn2.gif avn2_39.gif
  mv avn2.gif.001 avn2_40.gif
  mv avn2.gif.002 avn2_40a.gif
  mv avn2.gif.003 avn2_40b.gif
  mv avn2.gif.004 avn2_40c.gif
  mv avn2.gif.005 avn2_40d.gif
  keep avn2_39.gif avn2_40.gif avn2_40[a-d].gif 
  mv avn2_39.gif avn2_40.gif avn2_40[a-d].gif $WEBPIX/
endif
#
#endif
set grid=/data/gempak/model/gfs/${DATE}${1}_thin.gem
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE  = $grid
GDATTIM = f06-f72-06
DEVICE  = $device
PANEL   = 0
TEXT    = 1.2/21//hw
CONTUR  = 1
MAP     = 31/1/1
CLEAR   = yes
CLRBAR  = 31
GAREA   = 15;-129;60;-45
PROJ    = lcc/25;-95;25
LATLON  = 0
                                                                                                 
GLEVEL  = 2      !2 !10
GVCORD  = hght
GFUNC   = dwpf!tmpf!
GVECT   =   !      !wnd
WIND    = !  !bk29/0.8
SKIP    = !    !/1;1
SCALE   = 0 ! 0 !
CINT    = 5! 5 !
LINE    = 2/1/1/2           !32/1/2 !
TITLE   = 5/-2/ ~ GFS SFC T, DEW POINT (shaded) & WINDS |^ SFC T,DEW POINT & WINDS! 0
FINT    = -60;-10;0;10;20;25;30;40;50;55;60;65;70;75;80! !
FLINE   = 0;27-16--1;14-8--1
CTYPE   = c/f                !c !
HILO    =                  !
STNPLT  =0 !
\$mapfil=hipowo.gsf
list
run
                                                                                                 
exit
EOF

if (-e avn2.gif) then
cp avn2.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_sfcT_Td_wind_f06.gif
cp avn2.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_sfcT_Td_wind_f12.gif
cp avn2.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_sfcT_Td_wind_f18.gif
cp avn2.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_sfcT_Td_wind_f24.gif
cp avn2.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_sfcT_Td_wind_f30.gif
cp avn2.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_sfcT_Td_wind_f36.gif
cp avn2.gif.006 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_sfcT_Td_wind_f42.gif
cp avn2.gif.007 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_sfcT_Td_wind_f48.gif
cp avn2.gif.008 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_sfcT_Td_wind_f60.gif
cp avn2.gif.009 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_sfcT_Td_wind_f72.gif

mv avn2.gif avn2_41.gif
mv avn2.gif.001 avn2_42.gif
mv avn2.gif.002 avn2_43.gif
mv avn2.gif.003 avn2_44.gif
mv avn2.gif.004 avn2_45.gif
mv avn2.gif.005 avn2_46.gif
mv avn2.gif.006 avn2_47.gif
mv avn2.gif.007 avn2_48.gif
mv avn2.gif.008 avn2_49.gif
mv avn2.gif.009 avn2_50.gif
keep avn2_4[1-9].gif avn2_50.gif
mv avn2_4[1-9].gif avn2_50.gif $WEBPIX/
endif

set grid=/data/gempak/model/gfs/${DATE}${1}_gfs213.gem
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE  = $grid
GDATTIM = f84-f120-12
DEVICE  = $device
PANEL   = 0
TE+XT    = 1.2/21//hw
CONTUR  = 1
MAP     = 31/1/1
CLEAR   = yes
CLRBAR  = 31
GAREA   = 15;-129;60;-45
PROJ    = lcc/25;-95;25
LATLON  = 0
                                                                                                 
GLEVEL  =        !2 !10
GVCORD  = hght
GFUNC   =     !tmpf!
GVECT   =   !      !wnd
WIND    = !  !bk29/0.8
SKIP    = !    !/1;1
SCALE   = 0 ! 0 !
CINT    =  ! 5 !
LINE    = 2/1/1/2           !3/1/2 !
TITLE   = 5/-2/ ~ GFS SFC T, DEW POINT (shaded) & WINDS |^ SFC T,DEW POINT & WINDS! 0
FINT    = -60;-10;0;10;20;25;30;40;50;55;60;65;70;75;80! !
FLINE   = 0;27-16--1;14-8--1
CTYPE   =                    !c !
HILO    =                  !
STNPLT  =0 !
\$mapfil=hipowo.gsf
list
run
                                                                                                 
exit
EOF

if (-e avn2.gif) then
cp avn2.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_sfcT_Td_wind_f84.gif
cp avn2.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_sfcT_Td_wind_f96.gif
cp avn2.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_sfcT_Td_wind_f108.gif
cp avn2.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_sfcT_Td_wind_f120.gif

mv avn2.gif avn2_50a.gif
mv avn2.gif.001 avn2_50b.gif
mv avn2.gif.002 avn2_50c.gif
mv avn2.gif.003 avn2_50d.gif
keep avn2_50[a-d].gif 
mv  avn2_50[a-d].gif $WEBPIX/
endif


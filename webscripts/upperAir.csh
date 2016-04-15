source ../COMMON.csh

setenv DATA_DIR   /data/gempak/model
setenv SDATA_DIR  /data/gempak/upperair
setenv LOGFILE    www_upa


set grid=${DATA_DIR}/nam/${DATE}${1}_nam212.gem
set sgrid=${SDATA_DIR}/${DATE}_upa.gem

# set AREA="19;-129;53;-53"
set AREA="21;-121;51;-60"

gdplot << EOF > $LOGFILE
	GDFILE  = $grid
	GDATTIM = f00
	DEVICE  = GIF|up850.gif|720;540
	PANEL   = 0
	TEXT	= 1/21//hw
	CONTUR	= 1
	MAP     = 15/1/2
	CLEAR	= yes
	CLRBAR  = 1

	GAREA    = ${AREA}
	PROJ     = lcc/35;-95;20
	LATLON   = 0

	GLEVEL   = 850
	GVCORD   = pres
	SKIP     = /4/4
	SCALE    = 
	GFUNC    = tmpc    !   hght
	CTYPE    = c/f     !   c
	CONTUR   = 
	CINT     = 5       !   30
	LINE     = 19/1/1   !  32/1/3
	FINT     = 5
	FLINE    = 25-22--1;18-16--1;14-10--1
	HILO     = 
	HLSYM    = 2;1.5//21//hw
	CLRBAR   = 0
	GVECT    = WND 
	WIND     = 0
	REFVEC   = 
	TITLE    = 31/-2/~ 850 MB HEIGHTS AND TEMPERATURES (C)
	TEXT     = 1.0/2//hw
	SATFIL   = 
	RADFIL   = 
	STNPLT   =

	list
	run

	exit
EOF

$GEMEXE/snmap << EOF >> $LOGFILE
	\$RESPOND = YES
	AREA     = ${AREA}
	GAREA    = ${AREA}
	SATFIL   = 
	RADFIL   = 
	SNPARM   = ;tmpc;dpdc;rstz;brbk:1:2
	DATTIM   = ${date}/${1}
	LEVELS   = 850
	VCOORD   = pres
	SNFILE   = $sgrid
	COLORS   = 32
	LATLON   = 0
	MARKER   = 32/15
	TITLE    = 0
	CLEAR    = no
	PANEL    = 0/1/1/3
	DEVICE   = GIF|up850.gif|720;540
	PROJ     = lcc/35;-95;20
	FILTER   = no
	TEXT     = 0.8/21/1/HW
	LUTFIL   =
	STNPLT   =
	list
	run

	exit
EOF

$GEMEXE/gpend


gdplot << EOF >> $LOGFILE
	GDFILE	= $grid
	GDATTIM	= f00
	DEVICE	= GF|up700.gif|720;540

	GLEVEL   = 700
	GVCORD   = pres
	SKIP     = /4/4
	SCALE    = 
	GFUNC    = tmpc    !   hght
	CTYPE    = c/f     !   c
	CONTUR   = 
	CINT     = 5       !   30
	LINE     = 19/1/1   !  32/1/3
	FINT     = 5
	FLINE    = 25-22--1;18-16--1;14-10--1
	HILO     = 
	HLSYM    = 2;1.5//21//hw
	CLRBAR   = 0
	GVECT    = WND 
	WIND     = 0
	REFVEC   = 
	TITLE    = 31/-2/~ 700 MB HEIGHTS AND TEMPERATURES (C)
	TEXT     = 1.0/2//hw
	SATFIL   = 
	RADFIL   = 
	STNPLT   =
	list
	run

	exit
EOF

$GEMEXE/snmap << EOF >> $LOGFILE
	AREA     = ${AREA}
	GAREA    = ${AREA}
	SATFIL   =
	RADFIL   = 
	SNPARM   = ;tmpc;dpdc;rstz;brbk:1:2
	DATTIM   = ${date}/${1}
	LEVELS   = 700
	VCOORD   = pres
	SNFILE   = $sgrid
	COLORS   = 32
	LATLON   = 0
	MARKER   = 32/15
	TITLE    = 0
	CLEAR    = no
	PANEL    = 0/1/1/3
	DEVICE  = GIF|up700.gif|720;540
	PROJ     = lcc/35;-95;20
	FILTER   = no
	TEXT     = 0.8/21/1/HW
	LUTFIL   =
	STNPLT   =
	list
	run

	exit
EOF

$GEMEXE/gpend


$GEMEXE/gdplot << EOF >> $LOGFILE
	GDFILE	= $grid
	GDATTIM	= f00
	DEVICE	= GIF|up500.gif|720;540
	PANEL	= 0
	TEXT	= 1/21//hw
	CONTUR	= 1
	MAP      = 15/1/2
	CLEAR	= yes
	CLRBAR  = 1

	GAREA    = ${AREA}
	PROJ     = lcc/35;-95;20
	LATLON   = 0

	GLEVEL   = 500
	GVCORD   = pres
	SKIP     = /4/4
	SCALE    = 
	GFUNC    = tmpc    !   hght
	CTYPE    = c/f     !   c
	CONTUR   = 
	CINT     = 5       !   60
	LINE     = 19/1/1   !  32/1/3
	FINT     = 5
	FLINE    = 25-22--1;18-16--1;14-10--1
	HILO     = 
	HLSYM    = 2;1.5//21//hw
	CLRBAR   = 0
	GVECT    = WND 
	WIND     = 0
	REFVEC   = 
	TITLE    = 31/-2/~ 500 MB HEIGHTS AND TEMPERATURES (C)
	TEXT     = 1.0/2//hw
	SATFIL   = 
	RADFIL   = 
	STNPLT   =  
	list
	run

	exit
EOF

$GEMEXE/snmap << EOF >> $LOGFILE
	AREA     = ${AREA}
	GAREA    = ${AREA}
	SATFIL   = 
	RADFIL   =
	SNPARM   = ;tmpc;dpdc;rstz;brbk:1:2
	DATTIM   = ${date}/${1}
	LEVELS   = 500
	VCOORD   = pres
	SNFILE   = $sgrid
	COLORS   = 32
	LATLON   = 0
	MARKER   = 32/15
	TITLE    = 0
	CLEAR    = no
	PANEL    = 0/1/1/3
	DEVICE  = GIF|up500.gif|720;540
	PROJ     = lcc/35;-95;20
	FILTER   = no
	TEXT     = 0.8/21/1/HW
	LUTFIL   =
	STNPLT   =
	list
	run

	exit
EOF


$GEMEXE/gpend


$GEMEXE/gdplot << EOF >> $LOGFILE
	GDFILE	= $grid
	GDATTIM	= f00
	DEVICE	= GIF|up500v.gif|720;540

	GLEVEL   = 500
	GVCORD   = pres
	SKIP     = /4/4
	SCALE    = 
	GFUNC    = avor(obs)   !   hght
	CTYPE    = c/f     !   c
	CONTUR   = 
	CINT     = 2       !   60
	LINE     = 19/5/1   !   31/1/3
	FINT     = 10;14;18;20;22;24;26;28;30
	FLINE    = 0;24-22--1;18-16--1;14-4--1
	HILO     = 
	HLSYM    = 2;1.5//21//hw
	CLRBAR   = 0
	GVECT    = WND 
	WIND     = 0
	REFVEC   = 
	TITLE    = 31/-2/~ 500 MB HEIGHTS AND VORTICITY
	TEXT     = 1.0/2//hw
	SATFIL   = 
	RADFIL   = 
	STNPLT   = 
	list
	run

	exit
EOF

$GEMEXE/snmap << EOF >> $LOGFILE
	AREA     = ${AREA}
	GAREA    = ${AREA}
	SATFIL   = 
	RADFIL   =
	SNPARM   = ;tmpc;dpdc;rstz;brbk:1:2
	DATTIM   = ${date}/${1}
	LEVELS   = 500
	VCOORD   = pres
	SNFILE   = $sgrid
	COLORS   = 31
	LATLON   = 0
	MARKER   = 32/15
	TITLE    = 0
	CLEAR    = no
	PANEL    = 0/1/1/3
	DEVICE  = GIF|up500v.gif|720;540
	PROJ     = lcc/35;-95;20
	FILTER   = no
	TEXT     = 0.8/21/1/HW
	LUTFIL   =
	STNPLT   =
	list
	run

	exit
EOF

$GEMEXE/gpend


$GEMEXE/gdplot << EOF >> $LOGFILE
	GDFILE	= $grid
	GDATTIM	= f00
	DEVICE	= GIF|up300.gif|720;540
	PANEL	= 0
	TEXT	= 1/21//hw
	CONTUR	= 1
	MAP      = 15/1/2
	CLEAR	= yes
	CLRBAR  = 1

	GAREA    = ${AREA}
	PROJ     = lcc/35;-95;20
	LATLON   = 0

	GLEVEL   = 300
	GVCORD   = pres
	SKIP     = /4/4	
	SCALE    = 
	GFUNC    = sped    !   hght
	CTYPE    = c/f     !   c
	CONTUR   = 
	CINT     = 25;35;45;55;65;75;85;95      !   120
	LINE     = 19/1/1   !   32/1/3
	FINT     = 25;35;45;55;65;75;85;95
	FLINE    = 27-21--3;18-16--2;14-4--2
	HILO     = 
	HLSYM    = 2;1.5//21//hw
	CLRBAR   = 0
	GVECT    = WND 
	WIND     = 0
	REFVEC   = 
	TITLE    = 31/-2/~ 300 MB HEIGHTS AND WIND SPEEDS (M/S)
	TEXT     = 1.0/2//hw
	SATFIL   = 
	RADFIL   = 
	STNPLT   =  
	list
	run

	exit
EOF

$GEMEXE/snmap << EOF >> $LOGFILE
	AREA     = ${AREA}
	GAREA    = ${AREA}
	SATFIL   = /data/mcidas/AREA02\03\;04;05;06
	RADFIL   = 
	SNPARM   = ;tmpc;dpdc;rstz;brbk:1:2
	DATTIM   = ${date}/${1}
	LEVELS   = 300
	VCOORD   = pres
	SNFILE   = $sgrid
	COLORS   = 32
	LATLON   = 0
	MARKER   = 32/15
	TITLE    = 0
	CLEAR    = no
	PANEL    = 0/1/1/3
	DEVICE	= GIF|up300.gif|720;540
	PROJ     = lcc/35;-95;20
	FILTER   = no
	TEXT     = 0.8/21/1/HW
	LUTFIL   = 
	STNPLT   = 
	list
	run

	exit
EOF


$GEMEXE/gpend

$GEMEXE/gdplot << EOF >> $LOGFILE	
	GDFILE	= $grid
	GDATTIM	= f00
	DEVICE	= GIF|up200.gif|720;540
	GLEVEL   = 200
	GVCORD   = pres
	SKIP     = /4/4
	SCALE    = 
	GFUNC    = sped    !   hght
	CTYPE    = c/f     !   c
	CONTUR   = 
	CINT     = 25;35;45;55;65;75;85;95      !   120
	LINE     = 19/1/1   !   32/1/3
	FINT     = 25;35;45;55;65;75;85;95
	FLINE    = 27-21--3;18-16--2;14-4--2
	HILO     = 	
	HLSYM    = 2;1.5//21//hw
	CLRBAR   = 0
	GVECT    = WND 
	WIND     = 0
	REFVEC   = 
	TITLE    = 31/-2/~ 200 MB HEIGHTS AND WIND SPEEDS (M/S)
	TEXT     = 1.0/2//hw
	SATFIL   = 
	RADFIL   = 
	STNPLT   =  
	list
	run

exit
EOF

$GEMEXE/snmap << EOF >> $LOGFILE
	AREA     = ${AREA}
	GAREA    = ${AREA}
	SATFIL   = /data/mcidas/AREA02\03\;04;05;06
	RADFIL   = 
	SNPARM   = ;tmpc;dpdc;rstz;brbk:1:2
	DATTIM   = ${date}/${1}
	LEVELS   = 200
	VCOORD   = pres
	SNFILE   = $sgrid
	COLORS   = 32
	LATLON   = 0	
	MARKER   = 32/15
	TITLE    = 0
	CLEAR    = no
	PANEL    = 0/1/1/3
	DEVICE   = GIF|up200.gif|720;540
	PROJ     = lcc/35;-95;20
	FILTER   = no
	TEXT     = 0.8/21/1/HW
	LUTFIL   = 
	STNPLT   = 
	list
	run

	exit
EOF

$GEMEXE/gpend

cp up850.gif ${ARCHIVE}/850mb${date}${1}.gif
mv up850.gif $CURRENT/

cp up700.gif ${ARCHIVE}/700mb${date}${1}.gif
mv up700.gif $CURRENT/

cp up500.gif ${ARCHIVE}/500mb${date}${1}.gif
mv up500.gif $CURRENT/

cp up500v.gif ${ARCHIVE}/500VORT${date}${1}.gif
mv up500v.gif $CURRENT/

cp up300.gif ${ARCHIVE}/300mb${date}${1}.gif
mv up300.gif $CURRENT/

cp up200.gif ${ARCHIVE}/200mb${date}${1}.gif
mv up200.gif $CURRENT/

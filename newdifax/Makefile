#2080.gif: QAUA00.TIF
#	tifftopnm $< | pnmscale 0.333333 | pnmflip -r180 | ppmtogif > $@
#	./keep $@

2088.gif: 2088.pgm
	pnmflip -cw $< | ppmtogif > $@

#QAUA00.TIF:
#	wget ftp://weather.noaa.gov/fax/$@

.pgm.gif:
	pnmflip -r180 $< | ppmtogif > $@

.SUFFIXES: .gif .pgm .TIF

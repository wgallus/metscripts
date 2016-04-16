#!/bin/sh

# Credit to Geff for this scrip

for name in `cut -f1 skewStations`;
	do csh skewT.csh $1 ${name} `grep ^${name} skewStations | cut -f2` ;
done


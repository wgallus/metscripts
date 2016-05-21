#! /bin/csh 

wget http://weather.noaa.gov/pub/fax/QHUA15.TIF
convert -rotate 180 -resize 864x707 QHUA15.TIF 2024.gif
mv 2024.gif /webpix/difax/
rm QHUA15.TIF

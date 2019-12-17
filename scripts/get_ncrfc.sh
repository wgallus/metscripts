#!/bin/bash

cd /data/rdhm_forcings
sftp -q -b /home/meteor_ldm/projects/metscripts/scripts/get_ncrfc.txt -oIdentityFile=/home/meteor_ldm/.ssh/sftp.crh.noaa.gov.txt iastate@sftp.crh.noaa.gov

#!/bin/bash

cd /data/rdhm_forcings
sftp -q -b /home/ldm/scripts/get_ncrfc.txt -oIdentityFile=/home/ldm/.ssh/sftp.crh.noaa.gov.txt iastate@sftp.crh.noaa.gov

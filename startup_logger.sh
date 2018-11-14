#!/bin/sh
# this script will log the timestamp upon startup

# Change Log
# 1/21/18 - started

cd //home/pi/logs/
NOW=$(date +"%Y-%m-%d %H:%M:%S")

echo $NOW" System Startup" >> startup.log

#!/bin/sh
# log_retention.sh
# navigate to logs directory and delete logs older than configured days.  This script should be triggered via cron

#12/20/16 - Fixed pi log cleaning by adding * and sudo
# 7/4/17 - Fixed typo //var/log to //var/mail
# 8/27/17 - Added environment_monitor logs
# 10/12/17 - Added minestar_device_location_monitor
# 12/11/17 - Commented out m* monitor
# 2/3/18 - commented out environment_monitor

cd //home/pi/logs/
sleep 10
DAYS=7

cd cottage_monitor
find * -mtime +$DAYS -exec rm {} \;

cd ../mms_monitor
find * -mtime +$DAYS -exec rm {} \;

#cd ../environment_monitor
#find * -mtime +$DAYS -exec rm {} \;

#cd ../minestar_device_location_monitor
#find * -mtime +$DAYS -exec rm {} \;

cd //var/mail
sudo find -name "pi*" -mtime +$DAYS -exec rm {} \;
cd //

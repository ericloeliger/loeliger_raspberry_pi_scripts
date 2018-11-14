#!/bin/sh
# log_archiver.sh
# navigate to logs directory and create new logs by date.  This script should be triggered via cron

# Change Log
# 5/28/17 - Removed secondary mms_monitor and cottage_monitoring logs
# 8/27/17 - Added environment_monitor logs
# 9/12/17 - Added find for pi mail logs
# 10/12/17 - Added minestar_device_location_monitor
# 10/23/17 - Fixed find on pi mail logs
# 12/2/17 - Commented out M* and environment montior scripts
# 5/31/18 - Disabled mms_monitor.log

cd //home/pi/logs/
sleep 10
NOW=$(date +"%Y-%m-%d")

cd cottage_monitor
mv cottage_monitoring.log cottage_monitoring.log-$NOW
#mv cottage_monitor_sql.log cottage_monitor_sql.log-$NOW



cd ..
cd mms_monitor
#mv mms_monitor.log mms_monitor.log-$NOW
#mv mms_monitor_sql.log mms_monitor.log-$NOW
#mv mms_api.log mms_monitor.log-$NOW
mv mms_device_location_monitor.log  mms_device_location_monitor.log-$NOW

#cd ../minestar_device_location_monitor
#mv minestar_device_location_monitor.log  minestar_device_location_monitor.log-$NOW


#cd ../environment_monitor
#mv environment_monitor.log environment_monitor.log-$NOW


cd //var/mail/
if [ -f //var/mail/pi ]; then
 sudo mv pi pi-$NOW
fi


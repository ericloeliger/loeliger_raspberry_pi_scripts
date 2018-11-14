#!/bin/sh

# Script to gather key raspberry pi info and save in a JSON file

# NOTE: this script needs sudo permission to save the final output file in the proper place

# eric.loeliger@gmail.com
# 5/31/18 - started

# gather system information
CPUID=$(grep "Serial"  /proc/cpuinfo|cut -d " " -f2)

NICKNAME=$(cat //etc/nickname)

#debian 7 wheezy
#LAN_MAC=$(ifconfig|grep "eth0"|cut -d " " -f11)

#debian 9 stretch
LAN_MAC=$(ifconfig|grep -a3 "eth0"|grep "ether"|cut -d " " -f10|tr [a-z] [A-Z])

WIFI_MAC=$(ifconfig|grep -a3 "wlan0"|grep "ether"|cut -d " " -f10|tr [a-z] [A-Z])

BLUETOOTH_MAC=$(hciconfig -a|grep "BD Address"|cut -d " " -f3)

LINUX_PRETTY_NAME=$(grep "PRETTY" /etc/*-release|cut -d "\"" -f2)

DEBIAN_VERSION=$(cat //etc/debian_version)

TIMEZONE=$(cat //etc/timezone)

# store into JSON string
JSON="{\"cpu_id\": \""${CPUID}"\",\"nickname\": \""${NICKNAME}"\",\"lan_mac_address\": \""${LAN_MAC}"\",\"wifi_mac_address\": \""${WIFI_MAC}"\",\"bluetooth_mac_address\": \""${BLUETOOTH_MAC}"\",\"linux_pretty_name\": \""${LINUX_PRETTY_NAME}"\",\"debian_version\": "${DEBIAN_VERSION}",\"timezone\": \""${TIMEZONE}"\"}"

# store in file

echo "$JSON" > //etc/system_info.json

# print for user
echo "$JSON"
echo "Script Finished!"
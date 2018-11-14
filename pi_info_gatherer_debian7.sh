#!/bin/sh

# Script to gather key raspberry pi info and save in a JSON file
# eric.loeliger@gmail.com
# 5/31/18 - started

# gather system information
CPUID=$(grep "Serial"  /proc/cpuinfo|cut -d " " -f2)

NICKNAME=$(cat //etc/nickname)

LAN_MAC=$(ifconfig|grep "eth0"|cut -d " " -f11)

#WIFI_MAC=$()

#BLUETOOTH_MAC=$()

LINUX_PRETTY_NAME=$(grep "PRETTY" /etc/*-release|cut -d "\"" -f2)

DEBIAN_VERSION=$(cat //etc/debian_version)

TIMEZONE=$(cat //etc/timezone)

# store into JSON string
JSON="{\"cpu_id\": \""${CPUID}"\",\"nickname\": \""${NICKNAME}"\",\"lan_mac_address\": \""${LAN_MAC}"\",\"wifi_mac_address\": \""${LAN_MAC}"\",\"bluetooth_mac_address\": \""${LAN_MAC}"\",\"linux_pretty_name\": \""${LINUX_PRETTY_NAME}"\",\"debian_version\": "${DEBIAN_VERSION}",\"timezone\": \""${TIMEZONE}"\"}"

# store in file

echo "$JSON" > //etc/system_info.json

# print for user
echo "$JSON"
echo "Script Finished!"
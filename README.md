# loeliger_raspberry_pi_scripts

This repo contains my common To Do list for setting up new Raspberry Pi's as well as common shell and cron scripts.

## New Pi To Do

1. Set localization, timezone, keyboard (via GUI or raspi config)
2. apt-get update & apt-get upgrade, optionally apt-get autoremove
3. apt-get install dos2unix
4. Create Python Scripts, Shell Scripts, Logs directories
5. Create logs, pythons, shells, ericls alias'scripts
	nano ~/.bashrc
	source ~/.bashrc
6. Create nickname file (//etc/nickname)
7. Setup remot3.it/weaved
	sudo apt-get install weavedconnectd
	sudo weavedinstaller
	SSH 22, 5900 VNC, 5901 VNC-R, 3306 MySQL, 3389 XRDP
8. Deploy & test startup_logger.shell
9. Deploy & test log_archive.sh and log_retention.sh
10. Deploy & test ip_reporter.py (need to convert to not use MySQL)




#################### alias's #####################

alias logs='cd //home/pi/logs/'

alias pythons='cd //home/pi/Python_Scripts/'

alias shells='cd //home/pi/Shell_Scripts/'

alias ericls='ls -l -h'
#!/bin/bash
dateTime="$(date +%Y-%m-%d_%H%M%S)"
logDirectory="$HOME/logs"
logFile="firstBashScript_log_$dateTime.txt"
if test ! -d $logDirectory
	then
		mkdir $logDirectory
fi
echo "Updating your machine now..."
(apt-get update && apt-get upgrade -y) >> $logDirectory/$logFile
echo "Done updating"


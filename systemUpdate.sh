#!/bin/bash
# Define variables to be used
dateTime="$(date +%Y-%m-%d_%H%M%S)"
logDirectory="/var/log/systemUpdate/"
logFile="systemUpdate_log_$dateTime.txt"

# Test if the log directory exists
if [ ! -d $logDirectory ];
	then
		echo "Creating log directory $logDirectory"
		mkdir $logDirectory
fi

# Test if the log file exists
if [ ! -f $logDirectory$logFile ];
	then
		echo "Creating log file $logFile in $logDirectory"
		touch $logFile
fi

echo "Updating your machine now..."
(apt-get update && apt-get upgrade -y) >> $logDirectory$logFile
echo "Done updating"
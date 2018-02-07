#!/bin/bash
# Define variables to be used
dateTime="$(date +%Y-%m-%d_%H%M%S)"
logDirectory="/var/log/systemUpdate/"
logFile="systemUpdate_log_$dateTime.log"

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

# Confirm we're starting to update the machine now
echo "Updating your machine now..."

# Echo script start time to log
echo "Update started at $dateTime" >> $logDirectory$logFile

# Run apt-get commands to update repos and apply any relevant updates
(apt-get update && apt-get upgrade -y) >> $logDirectory$logFile

# Echo completetion time to log
echo "Update completed at $(date +%Y-%m-%d_%H%M%S)" >> $logDirectory$logFile

# Confirm update has finished
echo "Done updating"
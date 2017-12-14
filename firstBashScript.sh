#!/bin/bash
dateTime="$(date +%Y-%m-%d_%H%M%S)"
logFile="$HOME/logs/firstBashScript_log_$dateTime.txt"
echo "Updating your machine now..."
(apt-get update && apt-get upgrade -y) >> $logFile
echo "Done updating"


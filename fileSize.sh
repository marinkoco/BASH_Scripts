#this script is file size and writting it to a log
#recurrence to be handled with cron job

#!/bin/bash

#if needed to be set in a time stamp log format uncomment lines 7 and 8 and comment line 10
#current_time=$(date "+%Y.%m.%d-%H.%M.%S")
#echo -n "[INFO]" ; echo -n $current_time ; echo -n ": " ; du -sh <path to the file>

du -sh <path to the file> >> <path to the log>

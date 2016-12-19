#!/usr/bin/env bash


FILE="$1"
DAYS="$2"
CURDATE=$(date '+%b %d')
PREVDATE=$(date -d $DAYS+' days ago' '+%b %d')

ERRORCNT=$(awk "/$PREVDATE/,/$CURDATE/" $FILE | grep -i -c 'error')

echo 'Number of ERRORS for ' $FILE ' since ' $(date -d $DAYS+' days ago' '+%b %d') ': ' $ERRORCNT >> /var/log/dennis.log


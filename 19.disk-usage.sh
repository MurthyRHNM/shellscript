#!/bin/bash

DISK_USAGE=$(df -hT| grep xfs)
DISK_THRESOLD=6
MESSAGE=""

#+ it will append the output in MESSAGE variable 
while IFS= read -r line
do 
  USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
  FOLDER=$(echo $line | awk -F " " '{print $NF}')
  
  if [ $USAGE -ge 6 ]
   then
        MESSAGE+="$FOLDER is more than $DISK_THRESHOLD, Current usage: $USAGE \n"  
  fi
done <<< $DISK_USAGE

echo -e "Message : $MESSAGE"

echo "$MESSAGE" | mail -s "Disk Usage Alert" murthy4153@gmail.com
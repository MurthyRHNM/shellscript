#!/bin/bash

USER=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log

VALIDATE(){
    if [ $? -ne 0 ]
    then 
       echo "$2 .... failure"
       exit 1
    else
       echo "$2 .....success"
    fi
}

if [ $USER -ne 0 ]
 then 
      echo "Pleae run this script with super user"
      exit 1 # manually exit if error comes.
 else
      echo "your a super user"
fi

dnf install mysql -y
VALIDATE $? "installing mysql"
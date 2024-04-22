#!/bin/bash

USER=$(id -u)

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
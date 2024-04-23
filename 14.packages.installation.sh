#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOGFILE=$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 ...$R FAILED $N"
        exit 1
    else
        echo -e "$2 ...$G SUCCESS $N"
    fi
}
if [ $USERID -ne 0 ]
then 
    echo " Please run this script with super user"
    exit 1
else
    echo " you are a super user"
fi

for i in $@
do 
   echo "package of installation is $i"
   dnf list installed $i &>>LOGFILE
    if [ $? -eq 0 ]
    then
       echo "$i is already installed....SKIPPING"
    else
    dnf install $i -y &>>$LOGFILE
    VALIDATE $? "installing $i"
    fi
done

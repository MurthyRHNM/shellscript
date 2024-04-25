#!/bin/bash

set -e

failure(){
    echo "Failed at $1: $2"
}

trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root user"
    exit 1
else
   echo "you are a super user"
fi

dnf install mqsql-serverr -y

dnf install git -y

echo "script is procceding?"
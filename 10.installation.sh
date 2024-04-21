#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
 then 
      echo "Pleae run this script with super user"
 exit 1
 else
    echo "your a super user"
fi

dnf install mysql -y

if [ $? -ne 0 ] 

then 
    echo "installation is failure"
    exit 1
else
    echo "installation is success"
fi
     
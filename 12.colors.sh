USERID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
       echo -e "$2 .... $R FAILURE$N"
       exit 1
    else
       echo -e "$2 .....$G SUCCESS$N"
    fi
}

if [ $USERID -ne 0 ]
 then 
      echo "Pleae run this script with super user"
      exit 1 # manually exit if error comes.
 else
      echo "your a super user"
fi

dnf install git -y &>>$LOGFILE
VALIDATE $? "installing git"
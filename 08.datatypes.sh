#!/bin/bash

NUMBER1=$1
NUMBER2=$2
NO1=$NUMBER1
NO2=$NUMBER2
SUM=$(($NUMBER1+$NUMBER2))
SUB=$(($NO1-$NO2))
MUL=$(($NO1*$NO2))
DIV=$(($NO1/$NO2))

echo "first number is : $NUMBER1"
echo "second number is : $NUMBER2"
echo "sum of number is : $SUM"
echo "sub of numbers is :$SUB"
echo "multiplies of number is :$MUL"
echo "divisoin of number is :$DIV"S
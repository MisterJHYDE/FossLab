#!/bin/bash

clear

if [[ "$1" = "" || "$2" = "" ]]
then
	echo "Too Few Arguments"
	exit
fi

if [ "$3" != "" ]
then
	echo "Too Many Arguments"
	exit
fi

ulist=$1
username=$2

if [ ! -f "$ulist" ]
then
	echo "File not found"
	exit
fi

result=$(grep $username $ulist)

if [ "$result" != "" ]
then
	echo "Username already exists in file"
	exit
else
	echo "Username does not exist, adding to file"
	echo "$username" >> $ulist
	exit
fi